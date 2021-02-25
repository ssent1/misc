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
    var sheet = SpreadsheetApp.getActive().getSheetByName(
      "Weekly Top 3 Checklist"
    );
    var rangeList = sheet.getRangeList([
      "B4:C9",
      "G4:G9",
      "C13:C18",
      "G13:G18",
      "C21:C26",
      "G21:G26",
      "C30:C35",
      "G30:G35",
      "A37:G46",
    ]);
    rangeList.activate(); //https://developers.google.com/apps-script/reference/spreadsheet/range-list
    rangeList.clearContent(); //https://developers.google.com/apps-script/reference/spreadsheet/range-list#clearContent()
  }
  
  function clearCal() {
    var sheet = SpreadsheetApp.getActive().getSheetByName(
      "Weekly Top 3 Checklist"
    );
    var rangeList = sheet.getRangeList([
      "B4:C9",
      "C12:C17",
      "C20:C25",
      "C28:C33",
      "G4:G9",
      "G12:G17",
      "G20:G25",
      "G28:G33",
    ]);
    rangeList.activate(); //https://developers.google.com/apps-script/reference/spreadsheet/range-list
    rangeList.clearContent(); //https://developers.google.com/apps-script/reference/spreadsheet/range-list#clearContent()
  }
  
  function clearNotes() {
    var sheet = SpreadsheetApp.getActive().getSheetByName(
      "Weekly Top 3 Checklist"
    );
    sheet.getRange("A35:G40").clearContent();
  }
   SpreadsheetApp.getActive().getSheetByName( SpreadsheetApp.getActive().getSheetByName( SpreadsheetApp.getActive().getSheetByName(