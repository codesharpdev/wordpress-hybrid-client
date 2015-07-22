module.exports = angular.module 'wordpress-hybrid-client.cordova'
    .config ($cordovaAppRateProvider, $WPHCConfig) ->
        if !_.get $WPHCConfig, 'cordova.appRate.enabled'
            return

        document.addEventListener "deviceready", () ->
            preferences = _.get $WPHCConfig, 'cordova.appRate'
            $cordovaAppRateProvider.setPreferences preferences
        , false
    .run ($cordovaAppRate, $WPHCConfig) ->
        if !_.get $WPHCConfig, 'cordova.appRate.enabled'
            return
        $cordovaAppRate.promptForRating()
