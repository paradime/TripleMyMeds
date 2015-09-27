require 'rjb'

module HealthidsHelper
  def self.get_facial_features(photo)
    Rjb::load(classpath='.:FaceSDK.jar:jna.jar', jvmargs=[])
    fsdk = Rjb::import('Luxand.FSDK')
    himage = Rjb::import('Luxand.FSDK$HImage')
    features = Rjb::import('Luxand.FSDK$FSDK_Features$ByReference')
    fsdk.ActivateLibrary("Jv9tGsCU1UeKeh/NY/7SK5VRXQJVcvv9brYdae1Cp+h1lkWK526iMLWl9f63uWW6uA65yfEP5CJGlA2XAqnBr1LJUH9Si4i0lltmVYWZ7rIZ10fHlpT9h+10en9Hw6wmAuUf51oFmhjNw2BxwN1hptZQG/6/r2W7mmd90c/fbwU=")
    fsdk.Initialize()
    fsdk.SetFaceDetectionParameters(true, true, 500)
    img = himage.new
    fsdk.LoadImageFromFile(img, photo)
    facialFeatures = features.new
    fsdk.DetectFacialFeatures(img, facialFeatures)
    facialFeatures
  end

  def self.hash_key(arr)
    x_coords = []
    y_coords = []
    max_num = 50000
    arr.each { |p| x_coords << p.x; y_coords << p.y }
    coords = (x_coords+y_coords).flatten
    # coords.map { |e| (Math.sin((2 * Math::PI) * (((x + 48617).to_f % max_num) / max_num ) + 1) * max_num * 1000 ).round(0) }
    coords.map! { |x| x + 48617 }
    coords.map! { |x| x.to_f }
    coords.map! { |x| x / max_num }
    coords.map! { |x| x * 2 * Math::PI }
    coords.map! { |x| Math.sin(x) }
    coords.map! { |x| x + 1 }
    coords.map! { |x| x * max_num * 1000 }
    coords.map! { |x| x.round(0) }
    coords.map! { |x| x.to_s.rjust(9, '0') }
    str = ''
    coords.each_with_index do |x, index|
      break if index >= coords.length / 2
      str << x
      str << coords[index + (coords.length / 2)]
    end
    str
  end

  def self.unhash_key(key)

  end
end
