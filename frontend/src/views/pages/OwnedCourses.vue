<template>
  <div>
    <courses-list :courses="courses" mode="rating" />
  </div>
</template>

<script>
import StarRating from 'vue-star-rating'
import CoursesList from "../../components/partials/CoursesList";

export default {
  components: {
    CoursesList,
  },
  data: () => ({
    courses: [
      { id: 1, name: "PHP with Laravel for beginners - Become a Master in Laravel", description: "PHP with Laravel for beginners - Become a Master in Laravel", price: '379.00' },
      { id: 2, name: "Master Laravel 8 for Beginners & Intermediate", description: "Get from zero to proficiency in the Laravel Framework! Course for beginners and intermediate students!", price: '299.00' },
      { id: 3, name: "Python for Computer Vision with OpenCV and Deep Learning", description: "Python for Computer Vision with OpenCV and Deep Learning", price: '459.00' },
      { id: 4, name: "Microsoft Excel - Excel from Beginner to Advanced", description: "Microsoft Excel - Excel from Beginner to Advanced", price: '534.00' },
      { id: 5, name: "Mastering Data Structures & Algorithms using C and C++", description: "Learn, Analyse and Implement Data Structure using C and C++. Learn Recursion and Sorting.", price: '379.00' },
    ]
  }),
  mounted() {
    this.$http.get('/api/courses')
        .then(res => {
          console.log(res)
        })
  },
}
</script>
