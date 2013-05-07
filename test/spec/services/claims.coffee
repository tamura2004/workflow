'use strict'

describe 'Service: claims', () ->

  # load the service's module
  beforeEach module 'wfApp'

  # instantiate service
  claims = {}
  beforeEach inject (_claims_) ->
    claims = _claims_

  it 'claims#list', () ->
    expect(claims.list).toBeDefined()

  it 'claims#reset', () ->
    expect(claims.reset).toBeDefined()

  it 'claims#total', () ->
    expect(claims.total).toBeDefined()

