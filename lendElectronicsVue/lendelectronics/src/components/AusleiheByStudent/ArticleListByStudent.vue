<template>
<div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"><b>Email:</b></label>
        <div class="input-group col-sm-5">
            <input type="text" class="form-control input-group-append" placeholder="doe.sam743" aria-describedby="emailExtension" v-model="Email">
            <div>
                <span class="input-group-text" id="emailExtension">
                    <button class="btn btn-light" @click="Email => getStudent()">@sus-am-bk-tm.de</button>
                </span>
            </div>
        </div>

        <div class="col-sm-1 col-form-label">
            <button :disabled="!studentExists" class="btn btn-light" @click="(article, student) => Ausleihen_Button()">Ausleihen
                <span v-if="!isSaved" class="fa fa-floppy-o"></span>
                <span v-if="isSaved" class="fa fa-check"></span>
            </button>
        </div>
    </div>

    <div v-if="studentExists" class="form-group row">
        <label class="col-sm-2 col-form-lable"><b>Schülerdaten:</b></label>
        <div class="col-sm-5 col-form-label">
            <label class="form-control">{{student.Vorname +" "+ student.Nachname + " " + student.Klasse}}</label>
        </div>
    </div>

    <div class="input-group mb-3">

        <input type="text" placeholder="search article" class="form-control" aria-describedby="symbol-addon" v-model="searchArticle">
        <div class="input-group-prepend">
            <span class="input-group-text fa fa-search" id="symbol-addon"></span>
        </div>
    </div>

    <table class="table table-hover table-bordered">
        <thead>
            <tr>
                <th class="text-left" scope="col">Name</th>
                <th scope="col">Bezeichnung</th>
                <th scope="col">Anzahl</th>
                <th scope="col">Ausleihen</th>
                <th scope="col">Rückgeben</th>
            </tr>
        </thead>
        <tbody>

            <!-- articlesFlitered wird in computed berechnet -->
            <ArticleItem v-for="article in articlesFiltered" 
            :key="article.id" 
            :name="article.Name" 
            :bezeichnung="article.Bezeichnung" 
            :amount="article.amount" 
            :beschreibung="article.Beschreibung" 
            :disableButton="disableButtons"
            :onClickAusleihe="() => Ausleihen_Button()">
            </ArticleItem>
        </tbody>
    </table>
</div>
</template>

<script>
import ArticleItem from './ArticleItem.vue';
//import axios from 'axios'; // für Funktion Ausleihe PostData

//onClickAusleihe refernziert auf die Methode Ausleihen
export default {
    name: 'ArticleListByStudent',
    props: {
        article: Object, 
    },

    data: () => ({
        searchArticle: '',
        articles: [], 
        modalAusleihe: false, 
        modalRueckgabe: false,  
        currentId: 0, 
        disableButtons: false, 
        baseURL: process.env.VUE_APP_ROOT_API, 
        selected: 0,
        Email: '',
        student: null,
        isSaved: false,
        enableClose: true,
        studentExists: false
    }),

    components: {
        ArticleItem
    },
    //Laden von API
    mounted() {
        this.loadArticles();
    },

    methods: {

        async getStudent() {
            await this.$axios.get(this.baseURL + 'student/studentbyemail/' + this.Email + '@sus-am-bk-tm.de')
                .then((response) => {
                    if (response.data.length === 0) {
                        alert('Diese Emailadresse wurde nicht gefunden');
                    } else {
                        this.student = response.data[0];
                        this.studentExists = true;
                    }
                });

        },
        Ausleihen(id){
        //this.$refs.modalName.openModal();
        this.modalAusleihe=true;
        this.currentId = id;
        this.disableButtons = true;
        },

        async Ausleihen_Button() {
            console.log("Email: " + this.Email + '@sus-am-bk-tm.de');
            console.log("ArtikelID:" + this.currentId);
            console.log("Amount: " + this.selected);
            this.enableClose = false;
            await this.$axios.post("http://localhost:3000/borrow/loanout", {
                
                id_student: this.Email + '@sus-am-bk-tm.de',
                id_article: this.currentId,
                amount: this.selected
            }).then((response) => {
                if (response.data.affectedRows) {
                    this.isSaved = true;
                    this.enableClose = true;
                }
            });
        },

        /*
          Funktionen Ausleihe
        sendet aber problem mit borrowController

        PostData(){
            let Data = [{
                id_student: this.id_student,
                id_article: this.id_article,
                amount: this.amount
            }]
            axios.post("http://localhost:3000/borrow/loanout", Data)
            .then((result)=>{console.warn(result)})           
        },*/

        SchliessenAusleihe() {
            this.modalAusleihe = false;
            this.disableButtons = false;
            this.loadArticles();
        },

        /*
          Funktionen Rueckgabe
        */
        Rueckgeben(id) {
            this.modalRueckgabe = true;
            this.currentId = id;
            this.disableButtons = true;
        },

        SchliessenRueckgabe() {
            this.modalRueckgabe = false,
                this.disableButtons = false;
            this.loadArticles()
        },
        /*
          Funktionen Artikel
        */
        loadArticles() {
            this.$axios.get(this.baseURL + 'article/allarticle')
                .then(response => this.articles = response.data)
        },
    },
    computed: {
        articlesFiltered() {
            if (this.searchArticle.length > 2)
                return this.articles.filter(article => {
                    return (article.Bezeichnung.toLowerCase().includes(this.searchArticle.toLowerCase()) ||
                        article.Name.toLowerCase().includes(this.searchArticle.toLowerCase()) ||
                        article.Beschreibung.toLowerCase().includes(this.searchArticle.toLowerCase())
                    )
                });
            else {
                return this.articles;
            }
        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style scoped>
.input-group {
    width: 100%;
}

.table-hover tbody tr:hover th {
    background-color: #e9ecef !important;
}

.table-hover tbody tr:hover td {
    background-color: #e9ecef !important;
}
</style>
