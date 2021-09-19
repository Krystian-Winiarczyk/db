/*=========================================================================================
  File Name: store.js
  Description: Vuex store
  ----------------------------------------------------------------------------------------
  Item Name: Vuexy - Vuejs, HTML & Laravel Admin Dashboard Template
  Author: Pixinvent
  Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/


import Vue from 'vue'
import Vuex from 'vuex'

import state from "./state"
import getters from "./getters"
import mutations from "./mutations"
import actions from "./actions"
import courses from "./courses/courses";
import auth from "./auth/auth";
import notifications from "./notifications/notifications";
import sale from "./sale/sale";

Vue.use(Vuex)

export default new Vuex.Store({
    getters,
    mutations,
    state,
    actions,
    modules: [
        courses,
        auth,
        notifications,
        sale,
    ],
    strict: process.env.NODE_ENV !== 'production'
})
