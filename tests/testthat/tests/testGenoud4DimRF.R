app <- ShinyDriver$new("../", seed = 1)
app$snapshotInit("testGenoud4DimRF")

app$setInputs(addDimension = "click")
app$setInputs(dimensionType2 = "integer")
app$setInputs(dimensionAmount2 = 2)
app$setInputs(tabs = "spotConfig")
app$setInputs(optimizerSelector = "optimGenoud")
app$setInputs(xml_optimGenoudcontrol = TRUE)
app$setInputs(xml_optimGenoudcontrolpopulationSize = 40)
app$setInputs(xml_optimGenoudcontrolfunEvals = 200)
app$setInputs(modelSelector = "buildRandomForest")
app$setInputs(tabs = "runMode")
app$setInputs(runSpotIter = "click")
app$setInputs(runCreateDOE = "click")
app$setInputs(evaluateData = "click")
app$setInputs(proposeNewPoint = "click")
app$setInputs(evaluateData = "click")
app$setInputs(selectorXAUTO = "X4")
Sys.sleep(5)
app$snapshot(list(output = "resultTable"))

