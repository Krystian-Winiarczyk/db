<template>
  <div class="vx-row">
    <div class="vx-col w-full sm:w-1/3 lg:w-1/4 mb-base" v-for="user in users" :key="user.id">
      <vx-card>
        <vs-button type="relief" color="success" class="role-btn" v-if="user.role === 'T'">
          <feather-icon icon="GitlabIcon" />
        </vs-button>
        <div class="text-center">
          <vs-avatar :src="user.avatar" size="70px"/>
          <div>{{ user.name }}</div>
          <vs-button class="mt-2 mx-auto" variant="primary" size="small" icon-pack="feather" icon="icon-user-plus" @click="folowUser(user.id)">
            Follow
          </vs-button>
        </div>
      </vx-card>
    </div>
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Users",
  data: () => ({
    users: [],
  }),
  computed: {
    ...mapGetters({
      user: 'getCurrentUser',
    }),
  },
  mounted() {
    this.$store.dispatch('GET_USERS', this.user[0].id)
      .then(res => {
        console.log(res)
        this.users = res
      })
      .catch(err => {
        console.log(err)
      })
  },
  methods: {
    folowUser(userId) {
      const payload = {
        currentUser: this.user[0].id,
        userId,
      }
      this.$store.dispatch("FOLLOW_USER", payload)
        .then(res => {
          console.log(res)
        })
        .catch(err => {
          console.log(err)
        })
    },
  }
}
</script>

<style lang="scss">
  .role-btn {
    position: absolute;
    right: -10px;
    top: -10px;
  }
</style>
