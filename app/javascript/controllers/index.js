import { application } from "./application"
import consumer from "../channels/consumer"
import controller from "../controllers/application_controller"

// StimulusReflex

import StimulusReflex from "stimulus_reflex"
import CableReady from "cable_ready"
import controllers from "./**/**/*_controller.js"

controllers.forEach(controller => {
  application.register(controller.name, controller.module.default)
})

application.consumer = consumer
CableReady.initialize({ consumer })

StimulusReflex.initialize(application, { controller, isolate: true })
// StimulusReflex.debug = process.env.RAILS_ENV === "development"

// Stimulus Controllers

import Carousel from "stimulus-carousel"
application.register("carousel", Carousel)

import Timeago from "stimulus-timeago"
application.register("timeago", Timeago)

