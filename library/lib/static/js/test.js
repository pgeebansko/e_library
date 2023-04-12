const App = {
    data() {
     return {
        points_total:60,
        status: 0, //0 - начално положение; 1 -  тече тест; 2 - край на теста и показваме резултата
        timer: {
            h: 0,
            m: 0,
            s: 0,
            id: 0,
        },
        test: [],
        tasks_total: 0,
        }
     },

    methods: {
        removeGroup(t,max){ // търси индекс на елемент с атрибут group=g в масива t
                    let f = false
                    while (!f){
                        let i = 0
                        let g = 0
                        while (t[i]&&(g==0)){
                            if (!(t[i].group==0)){
                                g = t[i].group
                                }
                            i++
                            }
                        if (!(g == 0)){  // има група
                            let group_idx=[]
                            i = 0
                            for(task of t){
                                if(task.group==g){group_idx.push(i)}
                                i++
                                }
                            // избирам по случаен начин 1 от елементите на групата и го премахвам от списъка с въпросите
                            if((group_idx.length>1)&&(max<t.length)) {
                                i = group_idx[Math.floor(Math.random() * group_idx.length)]
                                t.splice(i,1)
                                }
                            else{t[group_idx[0]].group=0}
                            }
                        else {f = true}
                        }// while f
         },
        removeExtraTasks(t,max){
            let n = 0
            while (max < t.length){
                n = Math.floor(Math.random() * t.length)
                t.splice(n, 1)
                }
        },
        startTest(){
            vm = this
            vm.status = 1
            vm.timer.h = 0
            vm.timer.m = 0
            vm.timer.s = 0
            vm.testTimer()
            const theme_num_id=$("#theme_num_id").text();
            axios.get('/api/theme_items/'+theme_num_id)
            .then(function(response){
                vm.test = response.data;
                vm.timer.s = 0
                //тука трябва да се генерира тест
                for(item of vm.test){ // премахвам групираните въпроси ако е възможно
                    vm.removeGroup(item.tasks_knowledge, item.knowledge)
                    vm.removeExtraTasks(item.tasks_knowledge, item.knowledge)
                    vm.removeGroup(item.tasks_comprehension, item.comprehension)
                    vm.removeExtraTasks(item.tasks_comprehension, item.comprehension)
                    vm.removeGroup(item.tasks_application, item.application)
                    vm.removeExtraTasks(item.tasks_application, item.application)
                    vm.removeGroup(item.tasks_analysis, item.analysis)
                    vm.removeExtraTasks(item.tasks_analysis, item.analysis)
                    }
                // номерирам въпросите
                let num = 1
                for(item of vm.test){
                    for (task of item.tasks_knowledge){
                        task.num = num
                        num +=1
                    }
                    for (task of item.tasks_comprehension){
                        task.num = num
                        num +=1
                    }
                    for (task of item.tasks_application){
                        task.num = num
                        num +=1
                    }
                    for (task of item.tasks_analysis){
                        task.num = num
                        num +=1
                    }
                }
                vm.timer.id = setInterval(vm.testTimer, 1000)
                })
        },
        loadTheme(){
            vm = this
            const theme_id=$("#theme_id").text();
            const subject_id=$("#subject_id").text();
            vm.tasks_total=$("#tasks_total").text();
            axios.get('/api/test/'+subject_id+'/'+theme_id+'/')
            .then(function(response){
                vm.test = response.data[0];
                })
        },
        testTimer(){
            vm=this
            if(vm.status==1){
                vm.timer.s += 1
                if(vm.timer.s>59){
                    vm.timer.s = 0
                    vm.timer.m += 1
                    if(vm.timer.m>59){
                        vm.timer.m = 0
                        vm.timer.h += 1
                    }
                }
            }
        },
        valueTasks(t, points){ // оценяване на задачите от дадено ниво
            let total = 0
            let numOkBase = 0 // брой верни отговори по ключ
            let numOk = 0 // брой дадени верни отговори
            let numAnswers = 0 // брой дадени отговори
            let taskTotal = 0 // точки за конкретния въпрос
            let numOptions = 0 // брой отговори към въпроса
            if (t.length > 0){
                for (task of t){
                    numOkBase = 0; numOk = 0; numAnswers = 0; taskTotal = 0; numOptions = 0
                    if (task.type < 3){ // тип 1 или 2 - затворен въпрос
                        for(option of task.options){
                            numOptions++
                            if (option.checked_t){numAnswers++}
                            if (option.checked){numOkBase++}
                            if (option.checked_t && option.checked){numOk++}
                            }
                        if ((numOkBase >= numOk)&&(numOkBase>0)){
                            taskTotal += Math.round(points*numOk/numOkBase)
                            }
                        }
                    else if (task.type < 5){ // тип 1 или 2 - съпоставяне
                        for(option of task.options){
                            numOptions++
                            if (option.value_t){numAnswers++}
                            if (option.value_t && option.value){numOk++}
                            }
                        if(numOptions>0){ taskTotal += points*numOk/numOptions }
                        }
                    else { // отворен отговор
                        for(option of task.options){
                            numOptions++
                            if (task.options[0].value_t == option.value){numOk = 1}
                            }
                        taskTotal += points*numOk
                        }
                    total = total + taskTotal
                    }
                this.points_total += total
            }
        },
        stopTest(){
            this.status = 2
            clearInterval(vm.timer.id)
            // оценка на резултата
            this.points_total = 0
            for(item of this.test){
                    this.valueTasks(item.tasks_knowledge, 2)
                    this.valueTasks(item.tasks_comprehension, 4)
                    this.valueTasks(item.tasks_application, 6)
                    this.valueTasks(item.tasks_analysis, 8)
                }
            this.points_total = Math.round(this.points_total)
            this.sendTestResult()
        },
        sendTestResult(){
            const vm=this
            time = ((this.timer.h * 60) + this.timer.m) * 60 +this.timer.s
            axios({
                method:'POST',
                url:'/api/SaveTestResult/',
                headers:{
                    'X-CSRFToken':CSRF_TOKEN,
                    //'Access-Control-Allow-Origin':'*',
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    theme: this.theme.num,
                    points: this.points_total,
                    time: time
                }
            })
            .then(response => {
            })
            .catch(error => {
                throw("Error: ",error);
            })
        },
    },
    created: function(){
        this.status = 0
        this.loadTheme()
        console.log(this.status)
    }
}

Vue.createApp(App).mount('#app')