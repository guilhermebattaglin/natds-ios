import Quick
import Nimble

@testable import NatDS

final class NaturaColorPaletteDarkContentSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaColorPaletteDark.Content()

        describe("#highlight") {
            it("returns a string of a color hex expected for highlight color") {
                let colorHex = systemUnderTest.highlight
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#highEmphasis") {
            it("returns a string of a color hex expected for highEmphasis color") {
                let colorHex = systemUnderTest.highEmphasis
                let expectedHex = "#FAFAFA"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#mediumEmphasis") {
            it("returns a string of a color hex expected for mediumEmphasis color") {
                let colorHex = systemUnderTest.mediumEmphasis
                let expectedHex = "#BBBBBB"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#lowEmphasis") {
            it("returns a string of a color hex expected for lowEmphasis color") {
                let colorHex = systemUnderTest.lowEmphasis
                let expectedHex = "#777777"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#link") {
            it("returns a string of a color hex expected for link color") {
                let colorHex = systemUnderTest.link
                let expectedHex = "#227BBD"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onLink") {
            it("returns a string of a color hex expected for onLink color") {
                let colorHex = systemUnderTest.onLink
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }
    }
}
