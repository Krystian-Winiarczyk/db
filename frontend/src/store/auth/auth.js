import axiosIns from "../../axios";

export default {
    state: {
        currentUser: null,
    },
    getters: {
      getCurrentUser: state => state.currentUser,
    },
    mutations: {
        SET_CURRENT_USER(state, user) {
            state.currentUser = user
            localStorage.setItem('user', JSON.stringify(user))
        },
        REMOVE_CURRENT_USER(state) {
          state.currentUser = null
          localStorage.removeItem('user')
        },
    },
    actions: {
        LOGIN: ({ commit }, payload) => new Promise((resolve, reject) => {
            const { email, password } = payload
            axiosIns.post('api/auth/login', { email, password })
                .then(res => {
                    commit('SET_CURRENT_USER', res.data)
                    resolve(res.data)
                })
                .catch(err => {
                    reject(err)
                })
        }),
        LOGOUT: ({ commit }) => new Promise((resolve) => {
            commit('REMOVE_CURRENT_USER')
            resolve()
        })
    },
}
