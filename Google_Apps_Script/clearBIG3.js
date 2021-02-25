function onOpen() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var menubuttons = [
    {
      name: "Clear All",
      functionName: "clearAll",
    },
    {
      name: "Clear Calendar",
      functionName: "clearCal",
    },
    {
      name: "Clear Notes",
      functionName: "clearNotes",
    },
  ];
  ss.addMenu("Custom", menubuttons);
}

function clearAll() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet();
  var rangeList = sheet.getRangeList([
    "B4:C9",
    "G4:G9",
    "C13:C18",
    "G13:G18",
    "C21:C26",
    "G21:G26",
    "C30:C35",
    "G30:G35",
    "A37:G47",
  ]);
  rangeList.activate(); //https://developers.google.com/apps-script/reference/spreadsheet/range-list
  rangeList.clearContent(); //https://developers.google.com/apps-script/reference/spreadsheet/range-list#clearContent()
}

function clearCal() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet();
  var rangeList = sheet.getRangeList([
    "B4:C9",
    "G4:G9",
    "C13:C18",
    "G13:G18",
    "C21:C26",
    "G21:G26",
    "C30:C35",
    "G30:G35",
  ]);
  rangeList.activate(); //https://developers.google.com/apps-script/reference/spreadsheet/range-list
  rangeList.clearContent(); //https://developers.google.com/apps-script/reference/spreadsheet/range-list#clearContent()
}

function clearNotes() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet();
  sheet.getRange("A37:G47").clearContent();
}
