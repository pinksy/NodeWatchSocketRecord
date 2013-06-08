Option Explicit

Dim oFSO
Dim sFile
Dim oFile
Dim fruits 
Dim vegetables
Dim iType
Dim iVariety
Dim iSleep
Dim iSales
Dim sLine
Const ForAppending = 8

Set oFSO = CreateObject("Scripting.FileSystemObject")
sFile = "example.log"

fruits = Array("STRAWBERRY", "BANANA", "MANGO", "WATERMELON", "APPLE", "ORANGE", "PINEAPPLE", "GRAPE", "CHERRY", "KIWI")
vegetables = Array("CARROT", "POTATO", "TOMOATO", "ONION", "BROCCOLI", "MUSHROOM", "LETTUCE", "PEPPER", "PUMPKIN", "COURGETTE")

Do While True
  Randomize
  iType = Int(2 * Rnd + 1)
  iVariety = Int(10 * Rnd)
  iSales = Int(1001 * Rnd)
  iSleep = Int(601 * Rnd + 200)

  If iType = 1 Then
    sLine = "{""type"": ""fruit"", ""name"": """ & fruits(iVariety) & """, ""sales"": " & iSales & "}"
  Else
    sLine = "{""type"": ""vegetable"", ""name"": """ & vegetables(iVariety) & """, ""sales"": " & iSales & "}"
  End If

  WScript.Echo sLine
  Set oFile = oFSO.OpenTextFile(sFile,ForAppending,True)
  oFile.Write sLine & vbCrLf
  oFile.Close
  WScript.Sleep iSleep
Loop

