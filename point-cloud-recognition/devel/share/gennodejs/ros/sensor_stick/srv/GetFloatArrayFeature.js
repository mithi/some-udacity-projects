// Auto-generated. Do not edit!

// (in-package sensor_stick.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetFloatArrayFeatureRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cluster = null;
    }
    else {
      if (initObj.hasOwnProperty('cluster')) {
        this.cluster = initObj.cluster
      }
      else {
        this.cluster = new sensor_msgs.msg.PointCloud2();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetFloatArrayFeatureRequest
    // Serialize message field [cluster]
    bufferOffset = sensor_msgs.msg.PointCloud2.serialize(obj.cluster, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetFloatArrayFeatureRequest
    let len;
    let data = new GetFloatArrayFeatureRequest(null);
    // Deserialize message field [cluster]
    data.cluster = sensor_msgs.msg.PointCloud2.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.PointCloud2.getMessageSize(object.cluster);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sensor_stick/GetFloatArrayFeatureRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '526994c9d06037106595eb6bae52d4e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sensor_msgs/PointCloud2 cluster
    
    ================================================================================
    MSG: sensor_msgs/PointCloud2
    # This message holds a collection of N-dimensional points, which may
    # contain additional information such as normals, intensity, etc. The
    # point data is stored as a binary blob, its layout described by the
    # contents of the "fields" array.
    
    # The point cloud data may be organized 2d (image-like) or 1d
    # (unordered). Point clouds organized as 2d images may be produced by
    # camera depth sensors such as stereo or time-of-flight.
    
    # Time of sensor data acquisition, and the coordinate frame ID (for 3d
    # points).
    Header header
    
    # 2D structure of the point cloud. If the cloud is unordered, height is
    # 1 and width is the length of the point cloud.
    uint32 height
    uint32 width
    
    # Describes the channels and their layout in the binary data blob.
    PointField[] fields
    
    bool    is_bigendian # Is this data bigendian?
    uint32  point_step   # Length of a point in bytes
    uint32  row_step     # Length of a row in bytes
    uint8[] data         # Actual point data, size is (row_step*height)
    
    bool is_dense        # True if there are no invalid points
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: sensor_msgs/PointField
    # This message holds the description of one point entry in the
    # PointCloud2 message format.
    uint8 INT8    = 1
    uint8 UINT8   = 2
    uint8 INT16   = 3
    uint8 UINT16  = 4
    uint8 INT32   = 5
    uint8 UINT32  = 6
    uint8 FLOAT32 = 7
    uint8 FLOAT64 = 8
    
    string name      # Name of field
    uint32 offset    # Offset from start of point struct
    uint8  datatype  # Datatype enumeration, see above
    uint32 count     # How many elements in the field
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetFloatArrayFeatureRequest(null);
    if (msg.cluster !== undefined) {
      resolved.cluster = sensor_msgs.msg.PointCloud2.Resolve(msg.cluster)
    }
    else {
      resolved.cluster = new sensor_msgs.msg.PointCloud2()
    }

    return resolved;
    }
};

class GetFloatArrayFeatureResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.feature = null;
    }
    else {
      if (initObj.hasOwnProperty('feature')) {
        this.feature = initObj.feature
      }
      else {
        this.feature = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetFloatArrayFeatureResponse
    // Serialize message field [feature]
    bufferOffset = _arraySerializer.float32(obj.feature, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetFloatArrayFeatureResponse
    let len;
    let data = new GetFloatArrayFeatureResponse(null);
    // Deserialize message field [feature]
    data.feature = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.feature.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sensor_stick/GetFloatArrayFeatureResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '294d40af1af59d3ff9b78d3a0d06f00c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] feature
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetFloatArrayFeatureResponse(null);
    if (msg.feature !== undefined) {
      resolved.feature = msg.feature;
    }
    else {
      resolved.feature = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetFloatArrayFeatureRequest,
  Response: GetFloatArrayFeatureResponse,
  md5sum() { return 'c90ae3a91de76e55487209150231b931'; },
  datatype() { return 'sensor_stick/GetFloatArrayFeature'; }
};
