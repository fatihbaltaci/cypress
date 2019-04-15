require("../spec_helper")

path_helpers = require("#{root}lib/util/path_helpers")

describe "lib/util/path_helpers", ->
  context "checkIfResolveChangedRootFolder", ->
    check = path_helpers.checkIfResolveChangedRootFolder

    it "ignores non-absolute paths", ->
      expect(check('foo/index.js', 'foo')).to.eq(false)

    it "handles paths that do not switch", ->
      expect(check('/foo/index.js', '/foo')).to.eq(false)

    it "detects path switch", ->
      expect(check('/private/foo/index.js', '/foo')).to.eq(true)
