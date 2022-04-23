// **************************************************************
// *** Public app data
// *** Contain generic configuration accessible by the whole app
// **************************************************************

const appDebugMode = true;
const appDebugPaintSizeEnabled = false;
const appDebugShowCheckedModeBanner = false;

bool systemUnderTesting = false;

// Future<bool> networkInfoIsConnected = Future.value(false);  // Temporary...

/// If the backend is MongoDb then id field is {"_id":{"$oid":"61011f6d4558ebe4f88ac1c1"}}
// bool useMongoDbBackend = false;

/// Use shared_preferences package for persisting data
// bool useSharedPreferencesBackend = false;

/// Use http.client for persisting data
bool useHttpClient = false;
