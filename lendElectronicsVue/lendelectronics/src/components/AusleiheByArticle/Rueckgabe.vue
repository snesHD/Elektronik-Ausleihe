<template>
    <transition name="fade">
        <teleport to="#modalsAusleihe">

            <div class="card container"> 
                <div class="card-header">
                    <h2>Rückgabe {{article.Name}}</h2>
                </div>
            

                <div class="card-body">
                    <form @submit.prevent>
<!-- Input Email -->                    
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label"><b>Email:</b></label>
                                <div class=" input-group col-sm-5">
                                    <input  type="text" 
                                        class="form-control input-group-append"
                                        placeholder="doe.sam743" 
                                        aria-describedby="emailExtension"
                                        v-model="Email">
                                    <div class="input-group-append">
                                        <span class="input-group-text" 
                                            id="emailExtension" 
                                            @click="Email => getStudent()">
                                                <button class="btn btn-light">@sus-am-bk-tm.de</button>
                                        </span>
                                    </div>
                                </div>    
                            </div>

<!-- Bestäigung Schuelerdaten -->
                        <div v-if="studentExists" class="form-group row">
                            <label class="col-sm-2 col-form-lable"><b>Schülerdaten:</b></label>
                            <div class="col-sm-5 col-form-label">
                                <label class="form-control">{{student.Vorname +" "+ student.Nachname + " " + student.Klasse}}</label>
                            </div>
                        </div>

<!-- Auflistung der Ausgeliehenen Artikel -->                  
                            <div v-for="(loanArticle, indexList) in articleList" :key="loanArticle.id">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label"><b>Entliehen:</b></label>
                             
                                        <div class="col-sm-3 col-form-label"> 
                                            <div id="v-model-select"  class="form-control" aria-lable="seletedAmount"> 
                                            <select v-model.number="selected[indexList]">
                                                <option v-for="(item, index) in Array.apply(null, {length: loanArticle.amount}).map(Number.call, Number)" 
                                                    :key="index">{{item+1}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 col-form-label"> 
                                        <button class="btn btn-light orm-control float-right" 
                                            @click="() => rueckgabeDetail(indexList)">Rückgbe 
                                                <span v-if="!isSaved[indexList]" class="fa fa-floppy-o"></span> 
                                                <span v-if="isSaved[indexList]" class="fa fa-check"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>      
                    </form>               
                </div>
                <div class="card-footer">
                    <button :disabled="!enableClose" 
                        @click="onClickSchliessen" 
                        class="btn btn-light float-right">Schließen
                    </button>
                    <button v-if="isSaved" 
                        :disabled="!enableClose" 
                        @click="onClickWeiter => Weiter()" 
                        class="btn btn-light float-left">Weiter
                    </button>
                </div>
            </div>
        </teleport>
    </transition>   
</template>

<script>
export default {
    name: 'Rueckgabe',
    props: {
         article: Object,
         onClickSchliessen: Function
    },
    data: () => ({
        Email: '',
        student: null,
        articleList: [],
        baseUrl: process.env.VUE_APP_ROOT_API,
        selected: [],
        isSaved: [],
        studentExists: false,
        enableClose: true
    }),
    methods: {     
        async rueckgabeDetail(index){
            this.enableClose = false; 
            await this.$axios.post(this.baseUrl+'returndetails/returnarticle',{
                id_borrowed: this.articleList[index].id,
                amount: this.selected[index]
            }).then ( (response) => {
                if(response.data.affectedRows){
                    this.isSaved[index]=true; //über indxList
                    this.enableClose = true;      
                }
            });
        },
        
        async getStudent(){
            console.log(this.Email);
            await this.$axios.get(this.baseUrl+'student/studentbyemail/'+ this.Email + '@sus-am-bk-tm.de')
                .then( (response) => {
                    if(response.data.length === 0){
                        alert('Diese Emailadresse wurde nicht gefunden');
                    }
                    else{
                        this.student = response.data[0];
                        this.studentExists = true;    
                        this.ausgeliehen(this.student.id, this.article.id);
                    }
                });  
        },

        async ausgeliehen(id_student, id_article){
            await this.$axios.get(this.baseUrl+"student/lentarticlebystudent/"+ id_student + "/" + id_article)
            .then( (response) => {
                
                if( response.data.length === 0 ){
                    alert('Der Auszubildenden hat diesen Artikel nicht ausgeliehen');
                }
                else{
                    this.articleList = response.data;
                    this.selected = new Array(this.articleList.length).fill(0);
                    this.isSaved = new Array(this.articleList.length).fill(false);
                }
            });
        },

        Weiter(){
            this.studentExists = false;
            this.isSaved = false;
            this.articleList = null;
            this.Emai = '';
        }
    }
}
</script>

<style scoped>
    @import "../../css/modal-ausleihe.css";  
</style>