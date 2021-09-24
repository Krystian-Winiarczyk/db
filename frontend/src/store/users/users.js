import axiosIns from "../../axios";

export default {
    state: {},
    mutations: {},
    actions: {
        GET_USERS: ({ commit }, userId) => new Promise((resolve, reject) => {
            axiosIns.get(`api/users/${userId}`)
                .then(res => {
                    resolve(res.data)
                })
                .catch(err => {
                    reject(err)
                })
        }),
        FOLLOW_USER: ({ commit }, payload) => new Promise((resolve, reject) => {
            axiosIns.post(`api/users/follow`, payload)
                .then(res => {
                    resolve(res.data)
                })
                .catch(err => {
                    reject(err)
                })
        }),
    },
}
