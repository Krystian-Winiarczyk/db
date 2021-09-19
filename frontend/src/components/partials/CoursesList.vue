<template>
  <div class="vx-row">
    <div class="vx-col w-full sm:w-1/3 lg:w-1/4 mb-base"
         v-for="cours in courses"
         :key="cours.id"
    >
      <vx-card>
        <div style="position: relative;">
          <img :src="cours.image" alt="content-img" class="responsive rounded-lg">
          <div style="position: absolute; bottom: 5px; right: 5px">
            <vs-chip color="primary">
              <vs-avatar color="light-primary" icon-pack="feather" icon="icon-message-square" />
              <span style="letter-spacing: 1px">{{ cours.comments_count }}</span>
            </vs-chip>
            <vs-chip color="warning">
              <vs-avatar color="light-warning" icon-pack="feather" icon="icon-star" />
              <span style="letter-spacing: 1px">{{ cours.rating }}</span>
            </vs-chip>
          </div>
        </div>
        <div class="my-6">
          <h5 class="mb-2 flex justify-between">
            <vx-tooltip color="primary" :text="cours.teacher_name">
              <vs-avatar class="mr-5" :src="cours.avatar" style="min-width: 32px"/>
            </vx-tooltip>
            {{ cours.name | truncate(40, '...') }}
          </h5>
          <p class="text-grey">{{ cours.description | truncate(78, '...') }}</p>
        </div>
        <vs-divider></vs-divider>
        <div class="flex justify-center flex-wrap" v-if="mode === 'rating'">
          <star-rating :increment="0.5" :show-rating="false" :star-size="20" :border-width="4" border-color="#d8d8d8" :rounded-corners="true" :star-points="[23,2, 14,17, 0,19, 10,34, 7,50, 23,43, 38,50, 36,34, 46,19, 31,17]"></star-rating>
        </div>
        <div class="flex justify-between flex-wrap" v-else-if="mode === 'buy'">
          <span class="pt-2">
            <p class="text-xl">
              <vs-chip color="primary">
                <vs-avatar color="light-primary" icon-pack="feather" icon="icon-dollar-sign" />
                <span class="px-2 font-bold" style="letter-spacing: 1px">{{ cours.price.toFixed(2) }}</span>
              </vs-chip>
            </p>
          </span>
          <span>
            <p class="text-xl">
              <vs-button type="flat" line-origin="left" color="primary" @click="onBuyCours(cours)">Buy</vs-button>
            </p>
          </span>
        </div>
      </vx-card>
    </div>
  </div>
</template>

<script>
import StarRating from "vue-star-rating";

export default {
  name: "CoursesList",
  components: {
    StarRating,
  },
  props: {
    courses: {
      type: Array,
      default: [],
    },
    mode: {
      type: String,
      // buy, rating
      default: 'buy',
    },
  },
  mounted() {
    console.log(this.mode)
  },
  methods: {
    onBuyCours(cours) {
      this.$emit('buyCours', cours)
    }
  },
}
</script>

<style scoped>

</style>
