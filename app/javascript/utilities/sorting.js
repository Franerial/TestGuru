document.addEventListener('turbolinks:load', function () {
    var control = document.querySelector('.sort-by-title')

    if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
    var table = document.querySelector('table')

    // NodeList
    var rows = table.querySelectorAll('tr')
    var sortedRows = []

    //select all table rows except the rist one which is the header
    for (var i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    var arrowUp = table.querySelector('.octicon-arrow-up')

    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
        this.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    var sortedTable = document.createElement('table')

    sortedTable.classList.add('table', 'table-bordered')
    sortedTable.appendChild(rows[0])

    for (var i = 0; i < sortedRows.length; i++) {
        sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
    var TestTitle1 = row1.querySelector('td').textContent
    var TestTitle2 = row2.querySelector('td').textContent

    if (TestTitle1 < TestTitle2) { return -1 }
    if (TestTitle1 > TestTitle2) { return 1 }
    return 0
}

function compareRowsDesc(row1, row2) {
    var TestTitle1 = row1.querySelector('td').textContent
    var TestTitle2 = row2.querySelector('td').textContent

    if (TestTitle1 < TestTitle2) { return 1 }
    if (TestTitle1 > TestTitle2) { return -1 }
    return 0
}