<template>
	<div style="position: relative">
    <courses-list :courses="courses" mode="buy" @buyCours="onOpenBuyCoursModal" v-show="!loading" />

    <div v-show="loading" class="vs-con-loading__container" id="spinner-container" style="min-height: 50vh"></div>
    <vs-popup class="holamundo" title="Buy cours" :active.sync="showPopup" v-if="coursToBuy">
      <div class="flex">
        <img src="https://pixinvent.com/demo/vuesax-vuexy-vuejs-admin-dashboard-template/demo-1/img/content-img-2.00ef7d97.jpg" alt="content-img" class="responsive rounded-lg mr-4" style="max-width: 150px">
        <div>
          <h5 class="mb-2">{{ coursToBuy.name }}</h5>
          <p class="mb-2">{{ coursToBuy.description }}</p>
          <vs-chip color="primary" class="float-right">
            <vs-avatar color="light-primary" icon-pack="feather" icon="icon-dollar-sign" />
            <span class="px-2 font-bold" style="letter-spacing: 1px">{{ coursToBuy.price }}</span>
          </vs-chip>
        </div>
      </div>
      <div class="vx-row mt-2">
        <div class="vx-col w-full">
          <vs-input class="w-full" label="Card number" v-model="cardNumber" />
        </div>
      </div>
      <div class="vx-row mt-2">
        <div class="vx-col w-full">
          <vs-input class="w-full" label="Card owner" v-model="cardOwner" />
        </div>
      </div>
      <div class="vx-row mt-2">
        <div class="vx-col w-1/2">
          <vs-input class="w-full" label="Term of validity" v-model="cardTerm" />
        </div>
        <div class="vx-col w-1/2">
          <vs-input class="w-full" label="CVV" v-model="cardCvv" />
        </div>
      </div>
      <vs-button class="mt-3 vs-con-loading__container" color="success" type="flat" id="buy-btn" @click="onBuyCours">Buy</vs-button>
    </vs-popup>
  </div>
</template>

<script>
import CoursesList from "../components/partials/CoursesList";
import {mapGetters} from "vuex";
export default {
  components: {CoursesList},
  data: () => ({
    loading: true,
    showPopup: false,
    courses: [],
    coursToBuy: null,
    cardNumber: '',
    cardOwner: '',
    cardTerm: '',
    cardCvv: '',
  }),
  mounted() {
    this.$vs.loading({
      container: '#spinner-container',
      type: 'radius'
    })

    this.reloadCourses()
  },
  computed: {
    ...mapGetters({
      user: 'getCurrentUser'
    }),
  },
  methods: {
    reloadCourses() {
      this.loading = true
      setTimeout(() => {
        this.$store.dispatch('GET_ALL_COURSES')
          .then(res => {
            this.courses = res
          })
          .catch(err => {
            console.log(err)
          })
          .finally(() => {
            this.loading = false
          })
      }, 1000)
    },
    onOpenBuyCoursModal(cours) {
      this.showPopup = true
      this.coursToBuy = cours
    },
    onBuyCours() {
      this.$vs.loading({
        background: 'rgb(40, 199, 111)',
        color: '#fff',
        container: "#buy-btn",
        scale: 0.45
      })

      const payload = {
        ...this.coursToBuy,
        cardNumber: this.cardNumber,
        cardOwner: this.cardOwner,
        cardTerm: this.cardTerm,
        cardCvv: this.cardCvv,
        currentUser: this.user[0].id,
      }

      this.$store.dispatch('BUY_COURS', payload)
        .then(() => {
          setTimeout(() => {
            this.showPopup = false
            this.$vs.loading.close("#buy-btn > .con-vs-loading")
            this.reloadCourses()
          }, 500)
        })
        .catch(err => {
          console.log(err)
        })
    },
  }
}
</script>
