const ClientConfigDao = require('../../ClientConfigDao'); // Import the real dependency
const ClientConfigSvc = require('./ClientConfigSvc'); // Import the service

describe('ClientConfigSvc', () => {
  let clientConfigSvc;
  let clientConfigDaoMock;

  beforeEach(() => {
    // Create a manual mock for ClientConfigDao
    clientConfigDaoMock = {
      getClientDetails: jest.fn(),
      getCatDEtailforClient: jest.fn(),
    };

    // Inject the mocked DAO into the service
    clientConfigSvc = new ClientConfigSvc();
    clientConfigSvc.clientConfigDao = clientConfigDaoMock; // Replace real DAO with the mock
  });

  afterEach(() => {
    jest.clearAllMocks(); // Clear mock data
  });

  test('should call getClientDetails from ClientConfigDao', async () => {
    const mockClientDetails = [{ id: 1, name: 'Test Client' }];
    clientConfigDaoMock.getClientDetails.mockResolvedValue(mockClientDetails); // Mock return value

    const result = await clientConfigSvc.getClientDetails();

    // Assertions
    expect(clientConfigDaoMock.getClientDetails).toHaveBeenCalledTimes(1);
    expect(result).toEqual(mockClientDetails);
  });

  test('should call getCatDEtailforClient with correct client', async () => {
    const mockClient = 'Client123';
    const mockCategoryDetails = ['Type1', 'Type2'];
    clientConfigDaoMock.getCatDEtailforClient.mockResolvedValue(mockCategoryDetails); // Mock return value

    const result = await clientConfigSvc.getCategoryTypeDetails(mockClient);

    // Assertions
    expect(clientConfigDaoMock.getCatDEtailforClient).toHaveBeenCalledWith(mockClient);
    expect(result).toEqual(mockCategoryDetails);
  });
});
