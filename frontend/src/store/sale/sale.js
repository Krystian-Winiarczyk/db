import axiosIns from "../../axios";

export default {
    state: {},
    mutations: {},
    actions: {
        GET_USER_SALES: ({ commit }, userId) => new Promise((resolve, reject) => {
            axiosIns.get(`api/sales/${userId}`)
                .then(res => {
                    resolve(res.data)
                })
                .catch(err => {
                    reject(err)
                })
        }),
    },
}
