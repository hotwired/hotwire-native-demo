import "@hotwired/turbo"
import { Application } from "@hotwired/stimulus"
import "@hotwired/hotwire-native-bridge"

// Controllers
import MenuController from "./controllers/menu_controller.js"
import IframeController from "./controllers/iframe_controller.js"

// Bridge Components
import BridgeFormController from "./controllers/bridge/form_controller.js"
import BridgeMenuController from "./controllers/bridge/menu_controller.js"
import BridgeOverflowMenuController from "./controllers/bridge/overflow_menu_controller.js"

// Start Stimulus
window.Stimulus = Application.start()

// Register Controllers
Stimulus.register("menu", MenuController)
Stimulus.register("iframe", IframeController)

// Register Bridge Components
Stimulus.register("bridge--form", BridgeFormController)
Stimulus.register("bridge--menu", BridgeMenuController)
Stimulus.register("bridge--overflow-menu", BridgeOverflowMenuController)
