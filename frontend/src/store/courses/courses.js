import axiosIns from "../../axios";

export default {
    state: {},
    mutations: {},
    actions: {
        GET_ALL_COURSES: ({ commit }) => new Promise((resolve, reject) => {
            axiosIns.get('api/courses')
                .then(res => {
                    resolve(res.data)
                })
                .catch(err => {
                    reject(err)
                })
        }),
        GET_OWNED_COURSES: ({ commit }, userId) => new Promise((resolve, reject) => {
            axiosIns.get(`api/courses/owned/${userId}`)
                .then(res => {
                    resolve(res.data)
                })
                .catch(err => {
                    reject(err)
                })
        }),
        RATE_COURS: ({ commit }, payload) => new Promise((resolve, reject) => {
            axiosIns.post('api/courses/rate', payload)
        }),
        BUY_COURS: ({ commit }, payload) => new Promise((resolve, reject) => {
           axiosIns.post('api/courses/buy', payload)
               .then(res => {
                   console.log(res)
               })
               .catch(err => {
                   console.log(err)
               })
        }),
    },
}
