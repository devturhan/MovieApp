// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



#if MockyCustom
import SwiftyMocky
@testable import MovieApp

    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression, message, file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#elseif Mocky
import SwiftyMocky
import XCTest
@testable import MovieApp

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(expression(), message(), file: file, line: line)
    }
#else
import Sourcery
import SourceryRuntime
#endif


// MARK: - MovieListCollectionViewAdapterDelegate
open class MovieListCollectionViewAdapterDelegateMock: MovieListCollectionViewAdapterDelegate, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func scrolledToBottom() {
        addInvocation(.m_scrolledToBottom)
		let perform = methodPerformValue(.m_scrolledToBottom) as? () -> Void
		perform?()
    }

    open func didSelect(movie: Movie) {
        addInvocation(.m_didSelect__movie_movie(Parameter<Movie>.value(`movie`)))
		let perform = methodPerformValue(.m_didSelect__movie_movie(Parameter<Movie>.value(`movie`))) as? (Movie) -> Void
		perform?(`movie`)
    }


    fileprivate enum MethodType {
        case m_scrolledToBottom
        case m_didSelect__movie_movie(Parameter<Movie>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_scrolledToBottom, .m_scrolledToBottom):
                return true 
            case (.m_didSelect__movie_movie(let lhsMovie), .m_didSelect__movie_movie(let rhsMovie)):
                guard Parameter.compare(lhs: lhsMovie, rhs: rhsMovie, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_scrolledToBottom: return 0
            case let .m_didSelect__movie_movie(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func scrolledToBottom() -> Verify { return Verify(method: .m_scrolledToBottom)}
        public static func didSelect(movie: Parameter<Movie>) -> Verify { return Verify(method: .m_didSelect__movie_movie(`movie`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func scrolledToBottom(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_scrolledToBottom, performs: perform)
        }
        public static func didSelect(movie: Parameter<Movie>, perform: @escaping (Movie) -> Void) -> Perform {
            return Perform(method: .m_didSelect__movie_movie(`movie`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - MoviesLocalServiceProcotol
open class MoviesLocalServiceProcotolMock: MoviesLocalServiceProcotol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func isBookmarked(movie: Movie) -> Bool {
        addInvocation(.m_isBookmarked__movie_movie(Parameter<Movie>.value(`movie`)))
		let perform = methodPerformValue(.m_isBookmarked__movie_movie(Parameter<Movie>.value(`movie`))) as? (Movie) -> Void
		perform?(`movie`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_isBookmarked__movie_movie(Parameter<Movie>.value(`movie`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for isBookmarked(movie: Movie). Use given")
			Failure("Stub return value not specified for isBookmarked(movie: Movie). Use given")
		}
		return __value
    }

    open func bookmarked(movie: Movie) {
        addInvocation(.m_bookmarked__movie_movie(Parameter<Movie>.value(`movie`)))
		let perform = methodPerformValue(.m_bookmarked__movie_movie(Parameter<Movie>.value(`movie`))) as? (Movie) -> Void
		perform?(`movie`)
    }

    open func unBookmarked(movie: Movie) {
        addInvocation(.m_unBookmarked__movie_movie(Parameter<Movie>.value(`movie`)))
		let perform = methodPerformValue(.m_unBookmarked__movie_movie(Parameter<Movie>.value(`movie`))) as? (Movie) -> Void
		perform?(`movie`)
    }


    fileprivate enum MethodType {
        case m_isBookmarked__movie_movie(Parameter<Movie>)
        case m_bookmarked__movie_movie(Parameter<Movie>)
        case m_unBookmarked__movie_movie(Parameter<Movie>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_isBookmarked__movie_movie(let lhsMovie), .m_isBookmarked__movie_movie(let rhsMovie)):
                guard Parameter.compare(lhs: lhsMovie, rhs: rhsMovie, with: matcher) else { return false } 
                return true 
            case (.m_bookmarked__movie_movie(let lhsMovie), .m_bookmarked__movie_movie(let rhsMovie)):
                guard Parameter.compare(lhs: lhsMovie, rhs: rhsMovie, with: matcher) else { return false } 
                return true 
            case (.m_unBookmarked__movie_movie(let lhsMovie), .m_unBookmarked__movie_movie(let rhsMovie)):
                guard Parameter.compare(lhs: lhsMovie, rhs: rhsMovie, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_isBookmarked__movie_movie(p0): return p0.intValue
            case let .m_bookmarked__movie_movie(p0): return p0.intValue
            case let .m_unBookmarked__movie_movie(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func isBookmarked(movie: Parameter<Movie>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_isBookmarked__movie_movie(`movie`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func isBookmarked(movie: Parameter<Movie>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_isBookmarked__movie_movie(`movie`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func isBookmarked(movie: Parameter<Movie>) -> Verify { return Verify(method: .m_isBookmarked__movie_movie(`movie`))}
        public static func bookmarked(movie: Parameter<Movie>) -> Verify { return Verify(method: .m_bookmarked__movie_movie(`movie`))}
        public static func unBookmarked(movie: Parameter<Movie>) -> Verify { return Verify(method: .m_unBookmarked__movie_movie(`movie`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func isBookmarked(movie: Parameter<Movie>, perform: @escaping (Movie) -> Void) -> Perform {
            return Perform(method: .m_isBookmarked__movie_movie(`movie`), performs: perform)
        }
        public static func bookmarked(movie: Parameter<Movie>, perform: @escaping (Movie) -> Void) -> Perform {
            return Perform(method: .m_bookmarked__movie_movie(`movie`), performs: perform)
        }
        public static func unBookmarked(movie: Parameter<Movie>, perform: @escaping (Movie) -> Void) -> Perform {
            return Perform(method: .m_unBookmarked__movie_movie(`movie`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - MoviesWebServiceProtocol
open class MoviesWebServiceProtocolMock: MoviesWebServiceProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func fetchPopularMovies(onPage page: Int,                            onSuccess:@escaping ([Movie])->Void,                            onError:@escaping (Error) -> Void) {
        addInvocation(.m_fetchPopularMovies__onPage_pageonSuccess_onSuccessonError_onError(Parameter<Int>.value(`page`), Parameter<([Movie])->Void>.value(`onSuccess`), Parameter<(Error) -> Void>.value(`onError`)))
		let perform = methodPerformValue(.m_fetchPopularMovies__onPage_pageonSuccess_onSuccessonError_onError(Parameter<Int>.value(`page`), Parameter<([Movie])->Void>.value(`onSuccess`), Parameter<(Error) -> Void>.value(`onError`))) as? (Int, @escaping ([Movie])->Void, @escaping (Error) -> Void) -> Void
		perform?(`page`, `onSuccess`, `onError`)
    }


    fileprivate enum MethodType {
        case m_fetchPopularMovies__onPage_pageonSuccess_onSuccessonError_onError(Parameter<Int>, Parameter<([Movie])->Void>, Parameter<(Error) -> Void>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_fetchPopularMovies__onPage_pageonSuccess_onSuccessonError_onError(let lhsPage, let lhsOnsuccess, let lhsOnerror), .m_fetchPopularMovies__onPage_pageonSuccess_onSuccessonError_onError(let rhsPage, let rhsOnsuccess, let rhsOnerror)):
                guard Parameter.compare(lhs: lhsPage, rhs: rhsPage, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsOnsuccess, rhs: rhsOnsuccess, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsOnerror, rhs: rhsOnerror, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_fetchPopularMovies__onPage_pageonSuccess_onSuccessonError_onError(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func fetchPopularMovies(onPage page: Parameter<Int>, onSuccess: Parameter<([Movie])->Void>, onError: Parameter<(Error) -> Void>) -> Verify { return Verify(method: .m_fetchPopularMovies__onPage_pageonSuccess_onSuccessonError_onError(`page`, `onSuccess`, `onError`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func fetchPopularMovies(onPage page: Parameter<Int>, onSuccess: Parameter<([Movie])->Void>, onError: Parameter<(Error) -> Void>, perform: @escaping (Int, @escaping ([Movie])->Void, @escaping (Error) -> Void) -> Void) -> Perform {
            return Perform(method: .m_fetchPopularMovies__onPage_pageonSuccess_onSuccessonError_onError(`page`, `onSuccess`, `onError`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

