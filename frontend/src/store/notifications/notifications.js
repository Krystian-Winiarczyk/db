import axiosIns from "../../axios";

export default {
    state: {},
    mutations: {},
    actions: {
        GET_USER_NEW_NOTIFICATIONS: ({ commit }, userId) => new Promise((resolve, reject) => {
            axiosIns.get(`api/notifications/new/${userId}`)
                .then(res => {
                    resolve(res.data)
                })
                .catch(err => {
                    reject(err)
                })
        }),
        READ_NOTIFICATION: ({ commit }, notiId) => new Promise((resolve, reject) => {
            axiosIns.post(`api/notifications/read/${notiId}`)
                .then(() => {
                    resolve()
                })
                .catch(err => {
                    reject()
                })
        })
    },
}
