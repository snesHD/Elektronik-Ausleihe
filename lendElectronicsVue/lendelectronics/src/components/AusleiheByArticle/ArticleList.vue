<template>
  <div>
    <div class="input-group mb-3">
        
        <input  type="text" 
                placeholder="search article"
                class="form-control" 
                aria-describedby="symbol-addon"
                v-model="searchArticle"
                >
        <div class="input-group-prepend">
          <span class="input-group-text fa fa-search" id="symbol-addon"></span>
        </div>
    </div>

    <!--  Modal Ausleihe mit Teleport umgesetz 
          wird Akriviert durch Button ArrowDown in ArticleItem  -->
    <Ausleihe v-if="modalAusleihe" 
      :article="articles.find(article => article.id === currentId)"
      :onClickSchliessen="() => SchliessenAusleihe()">
    </Ausleihe>

    <!--  Modal Rückgabe mit Teleport umgesetz 
          wird Akriviert durch Button ArrowDown in ArticleItem  -->
    <Rueckgabe v-if="modalRueckgabe"
      :article="articles.find(article => article.id === currentId)"
      :onClickSchliessen="() => SchliessenRueckgabe()">
    </Rueckgabe>


    <table class="table table-hover table-bordered">
      <thead>
        <tr>
          <th class="text-left" scope="col">Name</th>
          <th scope="col">Bezeichnung</th>
          <th scope="col">Anzahl</th>
          <th scope="col">Ausleihen</th>
          <th scope="col">Rückgabe</th>                    
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
          :onClickAusleihe="() => Ausleihen(article.id)"
          :onClickRueckgabe="() => Rueckgeben(article.id)">
        </ArticleItem>
      </tbody>
    </table>  
  </div>    
</template>

<script>
import ArticleItem from './ArticleItem.vue';
import Ausleihe from './Ausleihe.vue';
import Rueckgabe from './Rueckgabe.vue';

//onClickAusleihe refernziert auf die Methode Ausleihen
export default {
  name: 'ArticleList',

  data: () => ({
    searchArticle: '',
    articles: [],                                 // Enthält alle Artikeldaten
    modalAusleihe: false,                         // Bei True wird das Modal geöffnet
    modalRueckgabe: false,                        // 
    currentId:0,                                  // Ausgewählte ArtikelID
    disableButtons: false,                        // Verhindert das öffenen eines Modals wenn bereits ein Modal geöffnet ist
    baseURL: process.env.VUE_APP_ROOT_API         // Basis URL des Servers wird .env auslgelesen VUE 3
  }),
  
  components: {
    ArticleItem,
    Ausleihe,
    Rueckgabe
  },
  //Laden von API
  mounted(){
    this.loadArticles();
  },
 
  methods: {
    /*
      Funktionen Ausleihe
    */
      Ausleihen(id){
        //this.$refs.modalName.openModal();
        this.modalAusleihe=true;
        this.currentId = id;
        this.disableButtons = true;
      },

      SchliessenAusleihe(){
        this.modalAusleihe = false;
        this.disableButtons = false;
        this.loadArticles();
      },

    /*
      Funktionen Rueckgabe
    */
      Rueckgeben(id){
        this.modalRueckgabe = true;
        this.currentId = id;
        this.disableButtons = true;
      },

      SchliessenRueckgabe(){
        this.modalRueckgabe = false,
        this.disableButtons = false;
        this.loadArticles()
      },
    /*
      Funktionen Artikel
    */
      loadArticles(){
        this.$axios.get(this.baseURL+'article/allarticle')
        .then(response => this.articles = response.data)
      },
  },
  computed: {
      articlesFiltered() {
        if(this.searchArticle.length>2)
          return this.articles.filter( article => 
            { return (article.Bezeichnung.toLowerCase().includes(this.searchArticle.toLowerCase())
                      ||
                      article.Name.toLowerCase().includes(this.searchArticle.toLowerCase())
                      ||
                      article.Beschreibung.toLowerCase().includes(this.searchArticle.toLowerCase())
                      )});       
        else{
          return this.articles;
        }
     }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.input-group{
  width: 100%;
}

.table-hover tbody tr:hover th {
  background-color:  #e9ecef!important;
}
.table-hover tbody tr:hover td {
  background-color: #e9ecef!important;
}
</style>
