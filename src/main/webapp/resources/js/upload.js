const attachService = (function () {
    async function uploadToServer(formObj, callback) {
        console.log("----- upload", formObj)
        // const res = await axios.post("/upload", formObj)
        const resp = await axios({
            method: 'post',
            url: '/attach/upload',
            data: formObj,
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        })

        callback(resp.data)
    }

    async function deleteToServer(fileName, callback){
        const options = {headers: { "Content-Type": "application/x-www-form-urlencoded"}}

        const resp = await axios.post("/attach/delete", "fileName="+fileName, options )

        callback(resp.data)
    }

    return {uploadToServer, deleteToServer}

})()