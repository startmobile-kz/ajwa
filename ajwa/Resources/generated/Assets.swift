// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum XCAsset {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let disclosure = ImageAsset(name: "Disclosure")
    internal static let location = ImageAsset(name: "Location")
    internal enum MainPage {
      internal static let clock = ImageAsset(name: "clock")
      internal static let compass = ImageAsset(name: "compass")
      internal static let ellipsis = ImageAsset(name: "ellipsis")
      internal static let mosque1 = ImageAsset(name: "mosque_1")
      internal static let mosque2 = ImageAsset(name: "mosque_2")
      internal static let mosqueIcon = ImageAsset(name: "mosque_icon")
      internal static let sacredEvent = ImageAsset(name: "sacred_event")
      internal static let solidBookQuran = ImageAsset(name: "solid_book_quran")
      internal static let speakerOff = ImageAsset(name: "speaker_off")
      internal static let speakerOn = ImageAsset(name: "speaker_on")
      internal static let vectorRight = ImageAsset(name: "vector_right")
    }
    internal static let rate = ImageAsset(name: "Rate")
    internal static let settings = ImageAsset(name: "Settings")
    internal static let share = ImageAsset(name: "Share")
    internal static let checkmark = ImageAsset(name: "checkmark")
    internal static let dot = ImageAsset(name: "dot")
    internal static let imgCheck = ImageAsset(name: "img-check")
    internal static let imgUncheck = ImageAsset(name: "img-uncheck")
    internal static let leftArrow = ImageAsset(name: "leftArrow")
    internal static let modify = ImageAsset(name: "modify")
    internal static let rightArrow = ImageAsset(name: "rightArrow")
    internal static let search = ImageAsset(name: "search")
    internal static let searchTextField = ImageAsset(name: "searchTextField")
  }
  internal enum Colors {
    internal static let background = ColorAsset(name: "background")
    internal static let black = ColorAsset(name: "black")
    internal static let blue = ColorAsset(name: "blue")
    internal static let brightgray = ColorAsset(name: "brightgray")
    internal static let celeste = ColorAsset(name: "celeste")
    internal static let controlsGray = ColorAsset(name: "controlsGray")
    internal static let darkGray = ColorAsset(name: "darkGray")
    internal static let darkgreen = ColorAsset(name: "darkgreen")
    internal static let gray = ColorAsset(name: "gray")
    internal static let gray20 = ColorAsset(name: "gray20")
    internal static let gray208 = ColorAsset(name: "gray208")
    internal static let gray60 = ColorAsset(name: "gray60")
    internal static let lightBlue = ColorAsset(name: "lightBlue")
    internal static let lightgray = ColorAsset(name: "lightgray")
    internal static let lightgreen = ColorAsset(name: "lightgreen")
    internal static let mediumGray = ColorAsset(name: "mediumGray")
    internal static let tableViewBackgroundGray = ColorAsset(name: "tableViewBackgroundGray")
    internal static let text = ColorAsset(name: "text")
    internal static let white = ColorAsset(name: "white")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
