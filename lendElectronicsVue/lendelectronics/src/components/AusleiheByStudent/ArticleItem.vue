<template>
<tr>
    <th class="text-left" scope="row" @click="toggle()">{{ name }}</th>
    <td>{{ bezeichnung }}</td>
    <td>{{ amount }}</td>
    <!-- Box Ausleihen -->
    <td>
        <select v-model.number="selected">
            <option @bind="test" @click="onClickAusleihe" v-for="(item, index ) in Array.apply(null, {length: amount+1}).map(Number.call, Number)" :key="index">{{item}}</option>

        </select>
    </td>
    <!-- Box Rückgeben -->
    <td>
        <select>
           <!-- <option v-for="(item, index) in Array.apply(null, {length: loanArticle.amount}).map(Number.call, Number)" :key="index">{{item+1}}</option> -->
        </select>
    </td>
    <td>
        <!-- Versuch den Button in Tabelle jede Zeile zu machen da in ArticleListStudent nur EMail mitgegeben 
        wird aber artikel nicht gefunden wird sowie die anzahl was aber hier in Article Item funktioniert-->
        <button :disabled="selected===0" class="btn btn-light" @click="(article, student) => Ausleihen()">Ausleihen
                <span v-if="!isSaved" class="fa fa-floppy-o"></span>
                <span v-if="isSaved" class="fa fa-check"></span>
        </button>
    </td>
</tr>

</template>

<script>
//onClickAusleihe ist eine Property vom Typ Funktion

export default {
    name: "ArticleItem",
    props: {
        id: Number,
        name: String,
        bezeichnung: String,
        amount: Number,
        beschreibung: String,
        price: Number,
        onClickAusleihe: Function,
        onClickRueckgabe: Function,
        disableButton: Boolean

    },
    data: () => ({
        isOpend: false, // isOpend wird definiert Lokale Property werden über Daten hinzugefügt
        articles: [],
        baseURL: process.env.VUE_APP_ROOT_API,
        student: null,
        test: 5 
    }),
    methods: { //Lokale Methode zum Aufklappen der Beschreibungsspalte
        toggle() {
            this.isOpend = !this.isOpend;
        },
        /* */
        Ausleihen(id){
        //this.$refs.modalName.openModal();
        this.modalAusleihe=true;
        this.currentId = id;
        this.disableButtons = true;
         console.log("Email: " + this.Email + '@sus-am-bk-tm.de');
            console.log("ArtikelID:" + this.article.id);
            console.log("Amount: " + this.test);
        },

        async Ausleihen_Button() {
            console.log("Email: " + this.Email + '@sus-am-bk-tm.de');
            console.log("ArtikelID:" + this.article.id);
            console.log("Amount: " + this.selected);
            this.enableClose = false;
            await this.$axios.post(this.baseUrl + 'borrow/loanout', {
                
                id_student: this.Email + '@sus-am-bk-tm.de',
                id_article: this.article.id,
                amount: this.selected
            }).then((response) => {
                if (response.data.affectedRows) {
                    this.isSaved = true;
                    this.enableClose = true;
                }
            });
        }, 
    }
};
</script>

<style scoped>
.btn {
    border: none;
    background-color: white;
}
</style>
