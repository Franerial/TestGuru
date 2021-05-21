import { SortedTable } from './SortedTable.js'

document.addEventListener('turbolinks:load', function () {
  const table_id = "test_table"
  const column_name = "level"
  const table = document.getElementById(table_id)

  if (table_id != "" && column_name != "" && table != null) new SortedTable(table_id, column_name)
})

