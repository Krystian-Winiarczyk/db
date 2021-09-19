<template>
  <div class="the-navbar__user-meta flex items-center" v-if="activeUserInfo.displayName">

    <div class="text-right leading-tight hidden sm:block">
      <p class="font-semibold">{{ user[0].name }}</p>
      <small>{{ user[0].role === 'S' ? 'Student' : 'Teacher' }}</small>
    </div>

    <vs-dropdown vs-custom-content vs-trigger-click class="cursor-pointer">

      <div class="con-img ml-3">
        <img v-if="activeUserInfo.photoURL" key="onlineImg" :src="activeUserInfo.photoURL" alt="user-img" width="40" height="40" class="rounded-full shadow-md cursor-pointer block" />
      </div>

      <vs-dropdown-menu class="vx-navbar-dropdown">
        <ul style="min-width: 11rem">

          <li
            @click="redirectTo('/courses')"
            class="flex py-2 px-4 cursor-pointer hover:bg-primary hover:text-white">
            <feather-icon icon="GridIcon" svgClasses="w-4 h-4" />
            <span class="ml-2">My courses</span>
          </li>

          <li
              @click="redirectTo('/courses/new')"
              class="flex py-2 px-4 cursor-pointer hover:bg-primary hover:text-white">
            <feather-icon icon="PlusIcon" svgClasses="w-4 h-4" />
            <span class="ml-2">Add course</span>
          </li>

          <vs-divider class="m-1" />

          <li
            @click="logout"
            class="flex py-2 px-4 cursor-pointer hover:bg-primary hover:text-white">
            <feather-icon icon="LogOutIcon" svgClasses="w-4 h-4" />
            <span class="ml-2">Logout</span>
          </li>
        </ul>
      </vs-dropdown-menu>
    </vs-dropdown>
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  computed: {
    ...mapGetters({
      user: 'getCurrentUser'
    }),
    activeUserInfo () {
      return this.$store.state.AppActiveUser
    }
  },
  methods: {
    redirectTo(path) {
      if (this.$route.path !== path) this.$router.push(path)
    },
    logout () {
      // This is just for demo Purpose. If user clicks on logout -> redirect
      this.$store.dispatch('LOGOUT')
        .then(() => {
          this.$router.push('/pages/login')
        })
    }
  }
}
</script>
