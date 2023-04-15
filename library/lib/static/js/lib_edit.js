const EDIT_NEW_QUESTION='Създаване на нов въпрос'
const EDIT_OLD_QUESTION='Редактиране на въпрос'

const App = {
    data() {
     return {
        theme_id: 0,
        theme_name: '',
        subject_id: 0,
        subject_name: '',

        editMode: EDIT_NEW_QUESTION,
        current_item: 0,
        level_name: '',
        question: {
                    id: 1,
                    text: "Въпрос от ниво знание на тема 1 точка 1",
                    type: 1,
                    picture: null,
                    item: 1,
                    deletedOptions:[1,2],
                    options: [
                        {
                            id: 1,
                            leading_char: "3",
                            text: "опция 1 на въпрос 1",
                            value: "",
                            value_name: "",
                            checked: true,
                            task: 1
                        }
                    ],
                    },
        themes: {}
        }
     },
    methods:{
        onImageChange(e){
            const file = e.target.files[0]
            this.question.picture = URL.createObjectURL(file)
            this.themes[this.question.item].picture = URL.createObjectURL(file)
            let formData = new FormData();
            formData.append('id', this.question.id)
            formData.append('picture', file)
            let url = ''
            const lvl=this.current_level
            if (lvl == 1){url = '/api/TaskKnowledgeFile/'}
            else if (lvl == 2){url = '/api/TaskComprehensionFile/'}
            else if (lvl == 3){url = '/api/TaskApplicationFile/'}
            else if (lvl == 4){url = '/api/TaskAnalysisFile/'}
            axios.post(url, formData, {headers: {'X-CSRFToken':CSRF_TOKEN, 'Content-Type': 'multipart/form-data'}})
        },
        make_q(itm, id/* OK */){ // превключва въпрос в режим на редактиране
            // itm  е № на темата, а № е id на въпроса
            const vm = this;
            vm.current_item = vm.themes[itm].id
            vm.question.item = itm
            vm.question = vm.themes[itm].question_theme[id]
            if (vm.question.level == 1){
                this.level_name = 'Знание'
            } else if (vm.question.level == 2){
                this.level_name = 'Разбиране'
            } else if (vm.question.level == 3){
                this.level_name = 'Приложение'
            } else {
                this.level_name = 'Анализ'
            }
            vm.editMode = EDIT_OLD_QUESTION
            this.question.deletedOptions = []
        },
        make_new_q(th/* OK ?? */){ // създава нов въпрос
            const vm=this
            axios({
                method:'POST',
                url:'/api/new_question/',
                headers:{
                    'X-CSRFToken':CSRF_TOKEN,
                    //'Access-Control-Allow-Origin':'*',
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    subject_id: this.subject_id,
                    theme_id: th,
                }
            })
            .then(response => {
                console.log('success - item was created');
                console.log('response ', response.data)
                const id=response.data
                axios.get('/api/q_themes/'+this.subject_id+'/'+this.theme_id+'/')
                    .then(function(response){
                        vm.themes = response.data
                    })
            // this.reloadItem()
            })
            .catch(error => {
                throw("Error: ",error);
            })
        },
        addEmptyOption(/* OK */){
            let newOption = {
                            id: 0,
                            leading_char: "",
                            text: "",
                            value: "",
                            value_name: "",
                            checked: false,
                            task:this.question.id,
                        }
            this.question.options.push(newOption)
        },
        deleteOption(idx/* OK */){
            console.log(this.question.deletedOptions)
            if (this.question.options[idx].id>0){
                this.question.deletedOptions[this.question.deletedOptions.length]=this.question.options[idx].id
                console.log(this.question.deletedOptions.toString())
                }
            this.question.options.splice(idx, 1)
        },
        deleteTask(idn/* OK ?? */){
            vm = this
            axios({
                method:'POST',
                url:'/api/delete_question/',
                headers:{
                    'X-CSRFToken':CSRF_TOKEN,
                    //'Access-Control-Allow-Origin':'*',
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    id: idn,
                }
            })
            .then(response => {
                console.log('success - item was deleted');
                vm.reloadItem()
            })
            .catch(error => {
                throw("Error: ",error);
            })
        },
        saveOption(i/* OK ?? */){
            vm = this
            axios({
                method:'POST',
                url:'/api/save_option/'+this.question.options[i].id+'/'+this.question.id+'/',
                headers:{
                    'X-CSRFToken':CSRF_TOKEN,
                    //'Access-Control-Allow-Origin':'*',
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    id: this.question.options[i].id,
                    ids: this.question.options[i].id,
                    task: this.question.options[i].task,
                    leading_char: this.question.options[i].leading_char,
                    text: this.question.options[i].text,
                    value: this.question.options[i].value,
                    value_name: this.question.options[i].value_name,
                    checked: this.question.options[i].checked,
                }
            })
            .then(response => {
                txt = 'Запазени промени във въпрос по тема'+vm.theme.num+' ; въпрос id='+vm.question.id+')'
                console.log(txt)
                window.alert(txt)
            })
            .catch(error => {
                throw("Error: ",error);
            })
        },
        saveQuestionBody(/* OK ?? */){
            axios({
                method:'POST',
                url:'/api/save_question/',
                headers:{
                    'X-CSRFToken':CSRF_TOKEN,
                    //'Access-Control-Allow-Origin':'*',
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    id: this.question.id,
                    ids: this.question.id,
                    text: this.question.text,
                    type: this.question.type,
                    level: this.question.level,
                }
            })
            .then(response => {
                console.log('success - item was deleted');
                for (ggg=0; ggg < this.question.options.length; ggg++){
                console.log(this.question.options[ggg])
                this.saveOption(ggg)}
            })
            .catch(error => {
                throw("Error: ",error);
            })
        },
        save(/* OK ?? */){
            /* 1. премахвам изтритите опции на въпроса*/
            axios({
                method:'POST',
                url:'/api/delete_option/',
                headers:{
                    'X-CSRFToken':CSRF_TOKEN,
                    //'Access-Control-Allow-Origin':'*',
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    ids: this.question.deletedOptions,
                }
            })
            .then(response => {
                console.log('success - item was deleted');
                this.saveQuestionBody()
            })
            .catch(error => {
                throw("Error: ",error);
            })
        },
        reloadItem(/* OK */){
            vm = this
            axios.get('/api/q_themes/'+this.subject_id+'/'+this.theme_id+'/')
            .then(function(response){
                vm.themes = response.data;
                for (i in vm.themes){
                console.log(i)}
                })
        },
    },
    created: function(){
        this.theme_id=$("#theme_id").text();
        this.theme_name=$("#theme_name").text();
        this.subject_id=$("#subject_id").text();
        this.subject_name=$("#subject_name").text();
        this.reloadItem();
    }

}

Vue.createApp(App).mount('#app')