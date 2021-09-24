<template>
  <div>
    <courses-list :courses="courses" mode="rating" :current-user-id="user[0].id" />
  </div>
</template>

<script>
import StarRating from 'vue-star-rating'
import CoursesList from "../../components/partials/CoursesList";
import {mapGetters} from "vuex";

export default {
  components: {
    CoursesList,
  },
  data: () => ({
    courses: []
  }),
  computed: {
    ...mapGetters({
      user: 'getCurrentUser'
    }),
  },
  mounted() {
    this.reloadCourses()
  },
  methods: {
    reloadCourses() {
      this.loading = true
      setTimeout(() => {
        this.$store.dispatch('GET_OWNED_COURSES', this.user[0].id)
            .then(res => {
              console.log(res)
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
  }
}
</script>
