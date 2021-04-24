<template>
  <transition name="fade">
<!-- teleport Vue 3 ersatz für modal -->    
  <teleport to="#modalsAusleihe">
    <div class="card container">
      <div class="card-header">
        <h2>Ausleihe: {{article.Name}}</h2>        
      </div>

<!-- Artikel Details -->
      <div class="card-body">
        <form @submit.prevent>
          <div class="form-group row">
            <label class="col-sm-2 col-form-label"><b>Bezeichnung:</b></label>
            <div class="col-sm-5 col-form-label">
              <label class="form-control">{{article.Bezeichnung}}</label>
            </div>
          </div>

<!-- Auswahl der Anzahl der Artikel -->
          <div class="form-group row">
            <label class="col-sm-2 col-form-label"><b>Anzahl:</b></label>
            <div class="col-sm-5 col-form-label"> 
              <div id="v-model-select"  class="form-control" aria-lable="seletedAmount"> 
                <select v-model.number="selected">
                  <option v-for="(item, index ) in Array.apply(null, {length: article.amount+1}).map(Number.call, Number)" 
                  :key="index">{{item}}</option>
                </select>
              </div>
            </div>
          </div>

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

<!-- Ausleihbutton -->
          <div v-if="student" class="form-group row">
            <div class="col-sm-1 col-form-label">
                <button :disabled="selected===0" 
                  class="btn btn-light" 
                  @click="(article, student) => Ausleihen()">Auseihen 
                  <span v-if="!isSaved" class="fa fa-floppy-o"></span> 
                  <span v-if="isSaved" class="fa fa-check"></span>
                </button>           
            </div>
          </div>

        </form>
      </div> 

<!-- Ausloggen -->        
      <div  class="card-footer">
          <button :disabled="!enableClose" 
            @click="onClickSchliessen" 
            class="btn btn-light float-right">Schliessen
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
  name: 'Ausleihe',
  props: {
  article: Object,
  onClickSchliessen: Function,
  onClickWeiter: Function
  },
  data: () => ({
    selected: 0,  
    Email: '',
    student: null,
    isSaved: false,
    enableClose: true,
    studentExists: false,
    baseUrl: process.env.VUE_APP_ROOT_API   
  }),

  methods: {
    
    async getStudent(){
      await this.$axios.get(this.baseUrl+'student/studentbyemail/'+ this.Email + '@sus-am-bk-tm.de')
      .then( (response) => {
        if(response.data.length === 0)
        {
          alert('Diese Emailadresse wurde nicht gefunden');
        }
        else
        {
          this.student = response.data[0];
          this.studentExists = true;
        }
      });
      
    },
    async Ausleihen(){
      this.enableClose=false;
      await this.$axios.post(this.baseUrl+'borrow/loanout',{
        id_student: this.student.id,
        id_article: this.article.id,
        amount: this.selected
      }).then( (response) => {
        if(response.data.affectedRows){
          this.isSaved=true;
          this.enableClose = true;      
        }
      });
    },
    Weiter(){
      this.studentExists = false;
      this.selected = 1;
      this.isSaved = false;
    }
  }  
}

</script>

<style scoped>
@import "../../css/modal-ausleihe.css"


</style>