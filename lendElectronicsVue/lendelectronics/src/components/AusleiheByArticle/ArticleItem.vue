<template >
  <tr>
    <th class="text-left" scope="row" @click="toggle()">{{ name }}</th>
    <td>{{ bezeichnung }}</td>
    <td>{{ amount }}</td>
    <!-- Button Ausleihe -->
    <td>
      <button class="btn btn-outline-light text-dark btn-xs"
        :disabled="disableButton"
        @click="onClickAusleihe">
            <span class="fa fa-arrow-circle-up"></span>
      </button>
    </td>
    <!-- Button Rückgabe -->
    <td>
      <button class="btn btn-outline-light text-dark"
        :disabled="disableButton"
        @click="onClickRueckgabe">
        <span class="fa fa-arrow-circle-down"></span>
      </button>
    </td>        
  </tr>
  <tr class="text-left" :class="isOpend" v-if="isOpend"> <!-- isOpend zum Aufklappen wird an die Komponente gebunden-->
    <td colspan="5"><b>Beschreibung: </b>{{ beschreibung }}</td>
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
  }),
  methods: { //Lokale Methode zum Aufklappen der Beschreibungsspalte
    toggle() {
      this.isOpend = !this.isOpend;
    },
  }
};
</script>

<style scoped>
.btn
{
  border: none;
  background-color: white;
}
</style>