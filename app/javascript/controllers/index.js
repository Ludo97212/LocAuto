// import Flatpickr
import Flatpickr from 'stimulus-flatpickr'
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

// Import style for flatpickr
require("flatpickr/dist/flatpickr.css")


const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))


// Manually register Flatpickr as a stimulus controller
application.register('flatpickr', Flatpickr)
