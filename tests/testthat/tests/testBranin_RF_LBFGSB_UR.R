app <- ShinyDriver$new("../", seed = 1)
app$snapshotInit("testBranin_RF_LBFGSB_UR")

app$setInputs(objectiveFunction = "rEnv")
app$setInputs(funName = "funBranin")
app$setInputs(addDimension = "click")
app$setInputs(addDimension = "click")
app$setInputs(dimensionType2 = "integer")
app$setInputs(dimensionType3 = "integer")
app$setInputs(lowerBound2 = -4)
app$setInputs(upperBound2 = 4)
app$setInputs(dimensionAmount2 = 2)
app$setInputs(lowerBound3 = 3)
app$setInputs(upperBound3 = 3)
app$setInputs(lowerBound3 = 1)
app$setInputs(dimensionAmount3 = 2)
app$setInputs(tabs = "spotConfig")
app$setInputs(modelSelector = "buildRandomForest")
app$setInputs(optimizerSelector = "optimLBFGSB")
app$setInputs(designSelector = "designUniformRandom")
app$setInputs(tabs = "runMode")
app$setInputs(runSpotIter = "click")
app$setInputs(runCreateDOE = "click")
app$setInputs(proposeNewPoint = "click")
app$setInputs(evaluateData = "click")
app$setInputs(proposeNewPoint = "click")
app$setInputs(evaluateData = "click")
Sys.sleep(2)
app$snapshot(list(output = "resultTable"))
