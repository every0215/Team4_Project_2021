 ClassicEditor.create(document.querySelector('#editor'), {
            toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ],
            heading: {
            options: [
                { model: 'paragraph', title: '大小', class: 'ck-heading_paragraph' },
                { model: 'heading1', view: 'h1', title: '大', class: 'ck-heading_heading1' },
                { model: 'heading2', view: 'h2', title: '中', class: 'ck-heading_heading2' },
                { model: 'heading3', view: 'h3', title: '小', class: 'ck-heading_heading3' },
            ]
        }
        })
            .then(editor => {
                console.log('Editor was initialized', editor);
            })
            .catch(err => {
                console.error(err.stack);
            });