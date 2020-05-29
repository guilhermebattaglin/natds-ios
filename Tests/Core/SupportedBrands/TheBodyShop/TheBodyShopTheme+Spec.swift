import Quick
import Nimble

@testable import NatDS

final class TheBodyShopThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopTheme()

        describe("#colors") {
            it("returns a instance of DynamicColors") {
                let colorPalette = systemUnderTest.colors

                expect(colorPalette).to(beAnInstanceOf(DynamicColors.self))
            }
        }

        describe("#sizes") {
            it("returns a instance of TheBodyShopSizes") {
                let sizes = systemUnderTest.sizes

                expect(sizes).to(beAnInstanceOf(TheBodyShopSizes.self))
            }
        }

        describe("#spacing") {
            it("returns a instance of TheBodyShopSpacing") {
                let spacing = systemUnderTest.spacing

                expect(spacing).to(beAnInstanceOf(TheBodyShopSpacing.self))
            }
        }

        describe("#borderRadius") {
            it("returns a instance of TheBodyShopBorderRadius") {
                let borderRadius = systemUnderTest.borderRadius

                expect(borderRadius).to(beAnInstanceOf(TheBodyShopBorderRadius.self))
            }
        }

        describe("#opacities") {
            it("returns a instance of TheBodyShopOpacities") {
                let opacities = systemUnderTest.opacities

                expect(opacities).to(beAnInstanceOf(TheBodyShopOpacities.self))
            }
        }

        describe("#font") {
            it("returns a instance of AvonFont") {
                let font = systemUnderTest.font

                expect(font).to(beAnInstanceOf(TheBodyShopFont.self))
            }
        }

        describe("#elevations") {
            it("returns a instance of TheBodyShopElevations") {
                let elevations = systemUnderTest.elevations

                expect(elevations).to(beAnInstanceOf(TheBodyShopElevations.self))
            }
        }
    }
}
