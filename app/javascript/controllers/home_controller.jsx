import { Controller } from "@hotwired/stimulus"

import React from 'react';
import { createRoot } from 'react-dom/client';

import App from "../core/components/app"

export default class extends Controller {
  connect() {
    // this.element.textContent = "Home"

    const root = createRoot(document.getElementById('app'));
    root.render(<App/>);
  }
}
