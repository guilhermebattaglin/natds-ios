import Nimble
import Quick

@testable import NatDS

final class UIViewControllerConfigureSpec: QuickSpec {
    override func spec() {
        var sut: UIViewController!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            sut = UIViewController()
        }

        describe("#configure(titleStyle:)") {
            context("when titleStyle is .title") {
                beforeEach {
                    sut.configure(titleStyle: .title("Title"))
                }
                it("sets navigationItem title") {
                    expect(sut.title).to(equal("Title"))
                }
                it("sets navigationItem titleView to nil") {
                    expect(sut.navigationItem.titleView).to(beNil())
                }
            }

            context("when titleStyle is .image") {
                beforeEach {
                    sut.configure(titleStyle: .logo)
                }
                it("sets navigationItem titleView") {
                    expect(sut.navigationItem.titleView).toNot(beNil())
                }
                it("sets navigationItem titleView with logo") {
                    let logoImageView = sut.navigationItem.titleView as? UIImageView
                    let logoImage = logoImageView?.image

                    expect(logoImage).to(equal(NatLogoImages.horizontal))
                }
            }
        }

        describe("#configure(button:)") {
            var buttons: [UIBarButtonItem]!

            beforeEach {
                buttons = [UIBarButtonItem()]
                sut.configure(buttons: buttons)
            }

            it("sets navigationItem right barButtonItems") {
                expect(sut.navigationItem.rightBarButtonItems).to(equal(buttons))
            }
        }
    }
}
