<template>
  <!-- NOTIFICATIONS -->
  <vs-dropdown vs-custom-content vs-trigger-click class="cursor-pointer">
    <feather-icon icon="BellIcon" class="cursor-pointer mt-1 sm:mr-6 mr-2" :badge="notifications.length" />

    <vs-dropdown-menu class="notification-dropdown dropdown-custom vx-navbar-dropdown">

      <div class="notification-top text-center p-5 bg-primary text-white">
        <h3 class="text-white">{{ notifications.length }} New</h3>
        <p class="opacity-75">Added within 24 hours</p>
      </div>

      <component :is="scrollbarTag" ref="mainSidebarPs" class="scroll-area--nofications-dropdown p-0 mb-10" :settings="settings" :key="$vs.rtl">
        <ul class="bordered-items">
          <li v-for="ntf in notifications" :key="ntf.index" class="flex justify-between px-4 py-4 notification cursor-pointer" @click="readNotification(ntf.id)">
            <div class="flex items-start">
              <vx-tooltip color="primary" :text="ntf.teacher_name">
                <vs-avatar :src="ntf.avatar" style="min-width: 30px" />
              </vx-tooltip>
              <div class="mx-2">
                <span class="font-medium block notification-title text-primary">Added a course</span>
                <small>{{ ntf.name }}</small>
              </div>
            </div>
            <small class="mt-1 whitespace-no-wrap">{{ elapsedTime(ntf.created_at) }}</small>
          </li>
        </ul>
      </component>

      <div class="
        checkout-footer
        fixed
        bottom-0
        rounded-b-lg
        text-primary
        w-full
        p-2
        font-semibold
        text-center
        border
        border-b-0
        border-l-0
        border-r-0
        border-solid
        d-theme-border-grey-light
        cursor-pointer">
        <span>View All Notifications</span>
      </div>
    </vs-dropdown-menu>
  </vs-dropdown>
</template>

<script>
import VuePerfectScrollbar from 'vue-perfect-scrollbar'
import {mapGetters} from "vuex";

export default {
  components: {
    VuePerfectScrollbar
  },
  data () {
    return {
      notifications: [
        {
          index    : 0,
          title    : 'New Message',
          msg      : 'Are your going to meet me tonight?',
          icon     : 'MessageSquareIcon',
          time     : this.randomDate({sec: 10}),
          category : 'primary'
        },
        { index    : 1,
          title    : 'New Order Recieved',
          msg      : 'You got new order of goods.',
          icon     : 'PackageIcon',
          time     : this.randomDate({sec: 40}),
          category : 'success'
        },
        { index    : 2,
          title    : 'Server Limit Reached!',
          msg      : 'Server have 99% CPU usage.',
          icon     : 'AlertOctagonIcon',
          time     : this.randomDate({min: 1}),
          category : 'danger'
        },
        { index    : 3,
          title    : 'New Mail From Peter',
          msg      : 'Cake sesame snaps cupcake',
          icon     : 'MailIcon',
          time     : this.randomDate({min: 6}),
          category : 'primary'
        },
        { index    : 4,
          title    : 'Bruce\'s Party',
          msg      : 'Chocolate cake oat cake tiramisu',
          icon     : 'CalendarIcon',
          time     : this.randomDate({hr: 2}),
          category : 'warning'
        }
      ],
      settings: {
        maxScrollbarLength: 60,
        wheelSpeed: .60
      }
    }
  },
  computed: {
    scrollbarTag () { return this.$store.getters.scrollbarTag },
    ...mapGetters({
      user: 'getCurrentUser'
    })
  },
  mounted() {
    setInterval(() => {
      this.reloadNotifications()
    }, 300000)
    this.reloadNotifications()
  },
  methods: {
    readNotification(notiId) {
      this.$store.dispatch('READ_NOTIFICATION', notiId)
          .then(() => {
            console.log(321)
            this.reloadNotifications()
          })
    },
    reloadNotifications() {
      const userId = this.user[0].id
      this.$store.dispatch('GET_USER_NEW_NOTIFICATIONS', userId)
        .then(res => {
          this.notifications = res
        })
    },
    elapsedTime (startTime) {
      const x        = new Date(startTime)
      const now      = new Date()
      let timeDiff = now - x
      timeDiff    /= 1000

      const seconds = Math.round(timeDiff)
      timeDiff    = Math.floor(timeDiff / 60)

      const minutes = Math.round(timeDiff % 60)
      timeDiff    = Math.floor(timeDiff / 60)

      const hours   = Math.round(timeDiff % 24)
      timeDiff    = Math.floor(timeDiff / 24)

      const days    = Math.round(timeDiff % 365)
      timeDiff    = Math.floor(timeDiff / 365)

      const years   = timeDiff

      if (years > 0) {
        return `${years + (years > 1 ? ' Years ' : ' Year ')}ago`
      } else if (days > 0) {
        return `${days + (days > 1 ? ' Days ' : ' Day ')}ago`
      } else if (hours > 0) {
        return `${hours + (hours > 1 ? ' Hrs ' : ' Hour ')}ago`
      } else if (minutes > 0) {
        return `${minutes + (minutes > 1 ? ' Mins ' : ' Min ')}ago`
      } else if (seconds > 0) {
        return seconds + (seconds > 1 ? ' sec ago' : 'just now')
      }

      return 'Just Now'
    },
    // Method for creating dummy notification time
    randomDate ({ hr, min, sec }) {
      const date = new Date()

      if (hr) date.setHours(date.getHours() - hr)
      if (min) date.setMinutes(date.getMinutes() - min)
      if (sec) date.setSeconds(date.getSeconds() - sec)

      return date
    }
  }
}

</script>

