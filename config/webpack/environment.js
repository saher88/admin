const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const erb = require('./loaders/erb')

environment.plugins.prepend(
 'Provide',
 new webpack.ProvidePlugin({
   $: "jquery",
   jQuery: 'jquery',
   jquery: 'jquery',
   moment: "moment",
   _: "lodash",
   Popper: ['popper.js', 'default']
 })
)

environment.loaders.prepend('erb', erb)
module.exports = environment
