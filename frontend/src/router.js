import Vue from 'vue'
import Router from 'vue-router'
import store from "./store/store";

Vue.use(Router)

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  scrollBehavior () {
    return { x: 0, y: 0 }
  },
  routes: [

    {
      // =============================================================================
      // MAIN LAYOUT ROUTES
      // =============================================================================
      path: '',
      component: () => import('./layouts/main/Main.vue'),
      children: [
        // =============================================================================
        // Theme Routes
        // =============================================================================
        {
          path: '/',
          name: 'courses',
          component: () => import('./views/Courses.vue'),
          meta: {
            requireAuth: true,
          }
        },
        {
          path: '/courses',
          name: 'owned-courses',
          component: () => import('./views/pages/OwnedCourses.vue'),
          meta: {
            requireAuth: true,
          }
        },
        {
          path: '/courses/new',
          name: 'new-courses',
          component: () => import('./views/pages/NewCours.vue'),
          meta: {
            requireAuth: true,
          }
        },
        {
          path: '/sales',
          name: 'sales',
          component: () => import('./views/pages/Sales.vue'),
          meta: {
            requireAuth: true,
          }
        },
        {
          path: '/users',
          name: 'users',
          component: () => import('./views/pages/Users.vue'),
          meta: {
            requireAuth: true,
          }
        },
        {
          path: '/page2',
          name: 'page-2',
          component: () => import('./views/Page2.vue'),
          meta: {
            requireAuth: true,
          }
        }
      ]
    },
    // =============================================================================
    // FULL PAGE LAYOUTS
    // =============================================================================
    {
      path: '',
      component: () => import('@/layouts/full-page/FullPage.vue'),
      children: [
        // =============================================================================
        // PAGES
        // =============================================================================
        {
          path: '/pages/login',
          name: 'page-login',
          component: () => import('@/views/pages/Login.vue')
        },
        {
          path: '/pages/error-404',
          name: 'page-error-404',
          component: () => import('@/views/pages/Error404.vue')
        }
      ]
    },
    // Redirect to 404 page, if no match found
    {
      path: '*',
      redirect: '/pages/error-404'
    }
  ]
})

router.beforeEach((to, from, next) => {
  if (to.meta && to.meta.requireAuth) {
    const user = JSON.parse(localStorage.getItem('user'))
    if (user) {
      store.commit('SET_CURRENT_USER', user)
      next()
    }
    // next('/pages/login')
  } else next()
})

router.afterEach(() => {
  // Remove initial loading
  const appLoading = document.getElementById('loading-bg')
  if (appLoading) {
    appLoading.style.display = 'none'
  }
})

export default router
