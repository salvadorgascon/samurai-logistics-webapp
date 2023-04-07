import { Controller } from "@hotwired/stimulus";

import React from "react";
import { createRoot } from "react-dom/client";

import App from "../core/components/app";

export default class extends Controller {
  connect() {
    const root = createRoot(document.getElementById("app"));
    root.render(<App />);
  }
}
