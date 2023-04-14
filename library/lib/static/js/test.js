const App = {
    data() {
     return {
        status: 0, //0 - начално положение; 1 -  тече тест; 2 - край на теста и показваме резултата
        timer: {
            h: 0,
            m: 0,
            s: 0,
            id: 0,
            },
        test: [],
        rate: 0.00,
        tasks_total: 0,
        theme_id: 0,
        theme_name: '',
        subject_id: 0,
        subject_name: '',
        total: 0,
        points_total_max: 0,
        }
     },

    methods: {
        startTest(){
            vm = this
            vm.status = 1
            vm.timer.h = 0
            vm.timer.m = 0
            vm.timer.s = 0
            vm.testTimer()
            axios.get('/api/test/'+this.subject_id+'/'+this.theme_id+'/')
            .then(function(response){
                vm.test = response.data;
                vm.timer.s = 0
                //тука трябва да се генерира тест
                let n = 0
                while (vm.tasks_total < vm.test.length){
                    n = Math.floor(Math.random() * vm.test.length)
                    vm.test.splice(n, 1)
                    }
                // номерирам въпросите
                let num = 1
                for(item of vm.test){
                    this.task.level *= 2
                    item.num = num
                    num +=1
                    }
                vm.timer.id = setInterval(vm.testTimer, 1000)
                })
        },
        loadTheme(){
            vm = this
            console.log('извикваме нещото')
            axios.get('/api/test/'+this.subject_id+'/'+this.theme_id+'/')
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
        valueTasks(){ // оценяване на задачите от дадено ниво
            let numOkBase = 0 // брой верни отговори по ключ
            let numOk = 0 // брой дадени верни отговори
            let numAnswers = 0 // брой дадени отговори
            let taskTotal = 0 // точки за конкретния въпрос
            let numOptions = 0 // брой отговори към въпроса
            let points = 0
            this.points_total_max = 0
            this.total = 0

            if (this.test.length > 0){
                for (task of this.test){
                    points = task.level
                    this.points_total_max += points
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
                    this.total = this.total + taskTotal
                    }
                this.rate = (this.total*100*0.06)/this.points_total_max
            }
        },
        stopTest(){
            this.status = 2
            clearInterval(vm.timer.id)
            // оценка на резултата
            this.valueTasks()
            if (this.rate<2){
                this.rate = 2.00
            }
            this.rate = Math.toFixed(2)
        },
    },
    created: function(){
        this.status = 0
        this.theme_id=$("#theme_id").text();
        this.theme_name=$("#theme_name").text();
        this.subject_id=$("#subject_id").text();
        this.subject_name=$("#subject_name").text();
        this.tasks_total=$("#tasks_total").text();
        this.loadTheme()

    }
}

Vue.createApp(App).mount('#app')