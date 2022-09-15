(function initEditor() {
    const ImageBlotOrigin = Quill.import('formats/image');
    class ImageBlot extends ImageBlotOrigin {
        static create(data) {
            console.log("------ blot", data)
            const node = super.create(data)

            node.setAttribute("src", `/attach/view?fileName=${data.link}`)

            node.setAttribute("data-uuid", data.uuid)
            node.setAttribute("data-link", data.link)
            node.setAttribute("data-filename", data.filename)
            node.setAttribute("data-img", data.img)
            node.setAttribute("data-filepath", data.filepath)
            node.setAttribute("class", "uploadImg")

            return node

            // return node
        }
        static value(node) {
            console.log("----- value", node)
            return node.dataset
        }
    }
    Quill.register(ImageBlot);
})()

const qEdit = (function() {
    const Delta = Quill.import("delta");
    const toolbarOptions = [['bold', 'italic'], ['link', 'image']]


    const write = (deltaStr) => {
        const quill = new Quill(".text-editor", {
            theme: 'snow',
            modules: {
                toolbar: toolbarOptions,
                imageResize: {
                    displaySize: true
                }
            }
        })

        const toolbar = quill.getModule('toolbar');

        toolbar.addHandler('image', (v) => {
            const input = document.createElement("input")
            input.setAttribute("type", "file")
            input.setAttribute("accept", "image/*")
            input.setAttribute("multiple", "")
            input.click()

            input.addEventListener("change", (e) => {
                const formObj = new FormData();

                for (let file of input.files) {
                    if(file.type.indexOf("image/") < 0) {
                        console.log("이미지가 아닌 파일 있음", file)
                        return
                    }
                    formObj.append("files", file)
                }

                attachService.uploadToServer(formObj, (data) => {
                    for (const img of data) {
                        const idx = quill.getSelection().index
                        quill.insertEmbed(idx, "image", img)
                        quill.insertText(idx+1, "\n")
                    }
                    quill.setSelection(quill.getLength(), 0);
                })
            })
        })

        if(deltaStr) {
            try {
                const delta = JSON.parse(
                    deltaStr.replace(/\n/gi, "\\n")
                        .replace(/\t/gi, "\\t")
                        .replace(/\r/gi, "\\r")
                )

                quill.setContents(delta, 'source')
            } catch (e) {}
        }

        return quill
    }

    const read = (deltaStr) => {
        const quill = new Quill(".text-editor", {
            modules: {
                toolbar: false
            },
            readOnly: true
        })

        try {
            const delta = JSON.parse(
                deltaStr.replace(/\n/gi, "\\n")
                    .replace(/\t/gi, "\\t")
                    .replace(/\r/gi, "\\r")
            )

            quill.setContents(delta, 'source')
        } catch (e) {}
    }

    return {write, read}
})()

