package com.app.core.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.core.entity.HospitalEntity;
import com.app.core.entity.PrescriptionEntity;
import com.app.core.repository.AppointmentRepository;
import com.app.core.repository.DoctorRepository;
import com.app.core.repository.HospitalRepository;
import com.app.core.repository.PatientRepository;
import com.app.core.repository.PrescriptionRepository;

@Service
public class PrescriptionService {

	@Autowired
	DoctorRepository doctorRepository;

	@Autowired
	HospitalRepository hospitalRepository;

	@Autowired
	AppointmentRepository appointmentRepository;

	@Autowired
	PatientRepository patientRepository;

	@Autowired
	PrescriptionRepository prescriptionRepository;

	@Autowired
	DoctorService doctorService;

	@Autowired
	AppointmentService appointmentService;

	// @PostMapping("/precReg")
	public void addPrec(PrescriptionEntity prescriptionEntity) {

		prescriptionRepository.save(prescriptionEntity);
		System.out.println("Hello");
	}

	public List<PrescriptionEntity> listPrescByDrIdPtId(int drId, int ptId) {
		List<PrescriptionEntity> PrecList = prescriptionRepository.findByDrIdAndPtId( ptId, drId);
		return PrecList;
	}
}
