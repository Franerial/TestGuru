document.addEventListener('turbolinks:load', function () {
    var control = document.querySelector('.sort-by-title')

    if (control) control.addEventListener('click', sortRowsByTitle)
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
        sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
        sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? -1 : 1)
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
