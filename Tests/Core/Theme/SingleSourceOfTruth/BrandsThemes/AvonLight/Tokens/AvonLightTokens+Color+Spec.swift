import Quick
import Nimble

@testable import NatDS

final class AvonLightTokensColorSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonLightTheme().tokens

        describe("#colorPrimary") {
            it("returns an expected value") {
                expect(systemUnderTest.colorPrimary).to(equal("#7F28C4"))
            }
        }

        describe("#colorOnPrimary") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnPrimary).to(equal("#FFFFFF"))
            }
        }

        describe("#colorPrimaryLight") {
            it("returns an expected value") {
                expect(systemUnderTest.colorPrimaryLight).to(equal("#B35BF8"))
            }
        }

        describe("#colorOnPrimaryLight") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnPrimaryLight).to(equal("#000000"))
            }
        }

        describe("#colorPrimaryDark") {
            it("returns an expected value") {
                expect(systemUnderTest.colorPrimaryDark).to(equal("#4B0092"))
            }
        }

        describe("#colorOnPrimaryDark") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnPrimaryDark).to(equal("#FFFFFF"))
            }
        }

        describe("#colorSecondary") {
            it("returns an expected value") {
                expect(systemUnderTest.colorSecondary).to(equal("#E2197C"))
            }
        }

        describe("#colorOnSecondary") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnSecondary).to(equal("#FFFFFF"))
            }
        }

        describe("#colorSecondaryLight") {
            it("returns an expected value") {
                expect(systemUnderTest.colorSecondaryLight).to(equal("#FF5EAB"))
            }
        }

        describe("#colorOnSecondaryLight") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnSecondaryLight).to(equal("#000000"))
            }
        }

        describe("#colorSecondaryDark") {
            it("returns an expected value") {
                expect(systemUnderTest.colorSecondaryDark).to(equal("#AA0050"))
            }
        }

        describe("#colorOnSecondaryDark") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnSecondaryDark).to(equal("#FFFFFF"))
            }
        }

        describe("#colorBackground") {
            it("returns an expected value") {
                expect(systemUnderTest.colorBackground).to(equal("#FAFAFA"))
            }
        }

        describe("#colorOnBackground") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnBackground).to(equal("#333333"))
            }
        }

        describe("#colorSurface") {
            it("returns an expected value") {
                expect(systemUnderTest.colorSurface).to(equal("#FFFFFF"))
            }
        }

        describe("#colorOnSurface") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnSurface).to(equal("#333333"))
            }
        }

        describe("#colorHighlight") {
            it("returns an expected value") {
                expect(systemUnderTest.colorHighlight).to(equal("#000000"))
            }
        }

        describe("#colorHighEmphasis") {
            it("returns an expected value") {
                expect(systemUnderTest.colorHighEmphasis).to(equal("#333333"))
            }
        }

        describe("#colorMediumEmphasis") {
            it("returns an expected value") {
                expect(systemUnderTest.colorMediumEmphasis).to(equal("#777777"))
            }
        }

        describe("#colorLowEmphasis") {
            it("returns an expected value") {
                expect(systemUnderTest.colorLowEmphasis).to(equal("#BBBBBB"))
            }
        }

        describe("#colorLink") {
            it("returns an expected value") {
                expect(systemUnderTest.colorLink).to(equal("#227BBD"))
            }
        }

        describe("#colorOnLink") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnLink).to(equal("#FFFFFF"))
            }
        }

        describe("#colorSuccess") {
            it("returns an expected value") {
                expect(systemUnderTest.colorSuccess).to(equal("#569A32"))
            }
        }

        describe("#colorOnSuccess") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnSuccess).to(equal("#FFFFFF"))
            }
        }

        describe("#colorWarning") {
            it("returns an expected value") {
                expect(systemUnderTest.colorWarning).to(equal("#FCC433"))
            }
        }

        describe("#colorOnWarning") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnWarning).to(equal("#333333"))
            }
        }

        describe("#colorAlert") {
            it("returns an expected value") {
                expect(systemUnderTest.colorAlert).to(equal("#E74627"))
            }
        }

        describe("#colorOnAlert") {
            it("returns an expected value") {
                expect(systemUnderTest.colorOnAlert).to(equal("#FFFFFF"))
            }
        }
    }
}
