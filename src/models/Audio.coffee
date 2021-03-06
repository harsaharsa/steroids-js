# Audio description
class Audio extends NativeObject
  # ### Steroids.audio.play
  #
  # Play an audio file from the file system
  #
  # #### Examples:
  #
  # Steroids.audio.play({
  #   path: "sounds/drum.mp3"
  # });
  #
  # Steroids.audio.play({
  #   absolutePath: Steroids.app.absolutePath + "/sounds/drum.mp3"
  # });
  #
  play: (options, callbacks={})->
    Steroids.on "ready", ()=>
      if options.absolutePath
        mediaPath = options.absolutePath
      else
        mediaPath = "#{Steroids.app.path}/#{options.path}"

      @nativeCall
        method: "play"
        parameters: {
          filenameWithPath: mediaPath
        }
        successCallbacks: [callbacks.onSuccess]
        failureCallbacks: [callbacks.onFailure]

  # ### Steroids.audio.prime()
  #
  # Preload the native audio framework to play sounds instantly
  #
  # #### Example:
  #
  # Steroids.audio.prime();
  #
  prime: (options={}, callbacks={})->
    @nativeCall
      method: "primeAudioPlayer"
      parameters: options
      successCallbacks: [callbacks.onSuccess]
      failureCallbacks: [callbacks.onFailure]
