// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from '../css/app.css';

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import 'phoenix_html';

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import {Socket} from 'phoenix';
import LiveSocket from 'phoenix_live_view';

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute('content');

let Hooks = {}
Hooks.OpenNotifications = {
  mounted() {
    this.el.addEventListener('click', e => {
      let list = document.getElementById('notifications-list');
      list.style.visibility = 'visible';
    })
  }
}

// Issue occurs even when not using Hooks
// document.getElementById("notifications-toggle").addEventListener('click', e => {
//   let list = document.getElementById('notifications-list');
//   list.style.visibility = 'visible';
// })

let liveSocket = new LiveSocket('/live', Socket, {
  hooks: Hooks,
  params: {_csrf_token: csrfToken},
});
liveSocket.connect();
